# Getting started with Equipe Extensions
#
# install required gems
# gem install sinatra jwt faraday faker rackup rerun
#
# The extension needs to be configured with this actions in the UI of Equipe
#
# | id | name     | path | role   | title    | target |
# |----|----------|------|--------|----------|--------|
# | 1  | scrubber |      | member | Scrubber | modal  |
#
# rerun "EXTENSION_SECRET=<SECRET> ruby scrubber.rb"


require 'sinatra'
require 'json'
require 'jwt'
require 'faraday'
require 'faker'
require 'securerandom'

class Equipe
  attr_reader :token

  def initialize(token)
    @token = token
    @data, _ = JWT.decode token, ENV['EXTENSION_SECRET']
  end

  def style_url
    data.dig('payload', 'style_url')
  end

  def view_name
    data.dig('payload', 'name').to_sym
  end

  def people
    JSON.parse(Faraday.get(people_url, {}, headers).body)
  end

  def horses
    JSON.parse(Faraday.get(horses_url, {}, headers).body)
  end

  def post(batch)
    Faraday.post(batch_url, JSON.pretty_generate(batch), headers)
  end

  private
    attr_reader :data

    def batch_url
      "#{data.dig('payload', 'meeting_url')}/batch"
    end

    def people_url
      "#{data.dig('payload', 'meeting_url')}/people"
    end

    def horses_url
      "#{data.dig('payload', 'meeting_url')}/horses"
    end

    def headers
      {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json',
        'X-TRANSACTION-UUID' => SecureRandom.uuid, # This will group the updates into a single update in Equipe it will be possible to undo all at once.
        'X-API-KEY' => data['api_key']
      }
    end
end

# important removes X-Frame-Options or sets it to X-Frame-Options: ALLOWALL
set :protection, except: :frame_options

# Receive a POST request for webhooks from Equipe and print the payload
post '/' do
  puts JSON.parse(request.body.read)
  status 200
end

get '/' do
  @equipe = Equipe.new(params[:token])

  erb @equipe.view_name
end

post '/scrubber' do
  @equipe = Equipe.new(params[:token])

  @batch = {
    people: {
      unique_by: :rnr,
      records: []
    },
    horses: {
      unique_by: :rnr,
      records: []
    }
  }

  if params[:people]
    @equipe.people.each do |person|
      @batch[:people][:records].push(
        rnr: person['rnr'],
        first_name: Faker::Name.unique.first_name,
        last_name: Faker::Name.unique.last_name,
        address: Faker::Address.unique.street_name,
        zipcode: Faker::Address.unique.zip_code,
        city: Faker::Address.unique.city,
        cell_phone: Faker::PhoneNumber.unique.cell_phone,
        work_phone: Faker::PhoneNumber.unique.phone_number,
        home_phone: Faker::PhoneNumber.unique.phone_number,
        email: Faker::Internet.unique.email
      )
    end
  end

  if params[:horses]
    @equipe.horses.each do |horse|
      @batch[:horses][:records].push(
        hnr: horse['hnr'],
        name: Faker::Creature::Horse.name
      )
    end
  end

  # Send the batch to Equipe
  @equipe.post @batch

  erb :scrubber_result
end

__END__

@@ layout
<!DOCTYPE html>
<html>
  <head>
    <title>Equipe Extension</title>
    <link rel="stylesheet" href="<%= @equipe.style_url %>" media="all">
  </head>
  <body class="extension">
    <%= yield %>
  </body>
</html>

@@ scrubber
<h2>Scrubb sensitive user data</h2>
<p>This will replace person and horse data with fake data</p>
<form action="/scrubber" method="post">
  <input type="hidden" name="token" value="<%= @equipe.token %>">
  <div class="checkbox">
    <label><input type="checkbox" name="people"> People</label>
  </div>
  <div class="checkbox">
    <label><input type="checkbox" name="horses"> Horses</label>
  </div>
  <button type="submit" class="btn btn-primary w-100">Perform</button>
</form>


@@ scrubber_result
<div class="alert alert-success">
  <strong>Success!</strong> Scrubbed <%= @batch[:people][:records].size %> people and <%= @batch[:horses][:records].size %> horses.
</div>
