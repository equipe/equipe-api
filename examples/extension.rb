# Getting started with Equipe Extensions
#
# install required gems
# gem install sinatra jwt faraday faker rackup rerun
#
# The extension needs to be configured with this actions in the UI of Equipe
#
# | id | name  | path | role   | title      | target |
# |----|-------|------|--------|------------|--------|
# | 1  | modal |      | member | Modal demo | modal  |
# | 2  | forms |      | member | Forms demo | modal  |
#
# rerun "EXTENSION_SECRET=<SECRET> ruby extension.rb"

require 'sinatra'
require 'json'
require 'jwt'
require 'faraday'
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

  private
    attr_reader :data
end

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

@@ modal
<code><%= JSON.pretty_generate(@data) %></code>

@@ forms
<form action="/action_page">
  <div class="form-group">
    <label for="email">Email address:</label>
    <input type="email" class="form-control" id="email">
  </div>
  <div class="form-group">
    <label for="pwd">Password:</label>
    <input type="password" class="form-control" id="pwd">
  </div>
  <div class="checkbox">
    <label><input type="checkbox"> Remember me</label>
  </div>
  <button type="submit" class="btn btn-default">Submit</button>
</form>
