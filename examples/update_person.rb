#!/usr/bin/env ruby
# Usage:
#   update_person.rb MEETING_ID PERSON_ID API_KEY FIRST_NAME LAST_NAME PHOTO_URL
#
# Example:
#   ./update_person.rb 123 456 abcdef012345 Jon Stenqvist https://placehold.co/400x400

require 'net/http'
require 'json'
require 'uri'

meeting_id, person_id, api_key, first_name, last_name, photo_url = ARGV
unless [meeting_id, person_id, api_key, first_name, last_name, photo_url].all?
  abort "Usage: #{$0} MEETING_ID PERSON_ID API_KEY FIRST_NAME LAST_NAME PHOTO_URL"
end

base_url = "https://app.equipe.com"  # ← replace with your real API base URL
uri = URI("#{base_url}/meetings/#{meeting_id}/people/#{person_id}")

# Build HTTP PATCH request
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = (uri.scheme == 'https')

req = Net::HTTP::Patch.new(uri)
req['X-Api-Key']     = api_key
req['Accept']        = 'application/json'
req['Content-Type']  = 'application/json'
req.body = {
  first_name: first_name,
  last_name: last_name,
  custom_fields: {
    url_to_photo: photo_url
  }
}.to_json

# Send and print response
res = http.request(req)
puts "Response: #{res.code} #{res.message}"
puts res.body
