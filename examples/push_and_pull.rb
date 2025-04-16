#!/usr/bin/env ruby
# frozen_string_literal: true

require 'net/http'
require 'json'
require 'securerandom'
require 'time'


API_KEY    = "YOUR_API_KEY"
MEETING_ID = "YOUR_MEETING_ID"
BASE_URL   = "https://app.equipe.com"

def get_competitions
  uri = URI("#{BASE_URL}/meetings/#{MEETING_ID}/competitions.json")
  req = Net::HTTP::Get.new(uri)
  req['X-Api-Key'] = API_KEY

  res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
    http.request(req)
  end

  puts "GET Competitions -> Status: #{res.code}"
  if res.is_a?(Net::HTTPSuccess)
    competitions = JSON.parse(res.body)
    puts "Competitions:"
    competitions.each do |comp|
      puts "- kq: #{comp['kq']}, clabb: #{comp['clabb']}, klass: #{comp['klass']}"
    end
  else
    puts "Error fetching competitions: #{res.body}"
  end
end

def get_start_list(kq = 1)
  uri = URI("#{BASE_URL}/meetings/#{MEETING_ID}/competitions/#{kq}/starts.json")
  req = Net::HTTP::Get.new(uri)
  req['X-Api-Key'] = API_KEY

  res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
    http.request(req)
  end

  puts "\nGET Start List (kq=#{kq}) -> Status: #{res.code}"
  if res.is_a?(Net::HTTPSuccess)
    starts = JSON.parse(res.body)
    puts "Start List Entries:"
    starts.each do |start_item|
      puts "- Rider: #{start_item['rider_name']}, Horse: #{start_item['horse_name']}, Start No: #{start_item['st']}"
    end
  else
    puts "Error fetching start list: #{res.body}"
  end
end

def push_batch(kq = 1)
  # Exact JSON from the "Push result list" section in the markdown,
  # but with kq set dynamically to whatever is passed in.
  batch_payload = {
    "competitions" => {
      "unique_by" => "kq",
      "records" => [
        {
          "kq"     => kq,
          "grundt" => 78,
          "omh1t"  => 63
        }
      ]
    },
    "starts" => {
      "unique_by" => "id",
      "where" => {
        "competition" => {
          "kq" => kq
        }
      },
      "replace" => true,
      "records" => [
        {
          "ord"       => 1000,
          "st"        => 1,
          "rnr"       => 1,
          "hnr"       => 4,
          "bnr"       => 1,
          "k"         => "H",
          "av"        => "A",
          "grundf"    => 0,
          "grundt"    => 66.14,
          "tfg"       => 0,
          "omh1f"     => 0,
          "omh1t"     => 55.3,
          "tf1"       => 0,
          "totfel"    => 0,
          "re"        => 1,
          "rid"       => true,
          "premie"    => 500,
          "premie_show" => 500,
          "result_at" => Time.now.iso8601,
          "last_result_at" => Time.now.iso8601,
          "or"        => "",
          "a"         => "",
        },
        {
          "ord"       => 1004,
          "st"        => 5,
          "rnr"       => 3,
          "hnr"       => 3,
          "bnr"       => 3,
          "k"         => "H",
          "av"        => "A",
          "grundf"    => 3,
          "grundt"    => 80.7,
          "tfg"       => 3,
          "omh1f"     => 0,
          "omh1t"     => 47.21,
          "tf1"       => 0,
          "totfel"    => 3,
          "re"        => 2,
          "rid"       => true,
          "premie"    => 300,
          "premie_show" => 300,
          "result_at" => Time.now.iso8601,
          "last_result_at" => Time.now.iso8601,
          "or"        => "",
          "a"         => ""
        },
        {
          "ord"       => 1003,
          "st"        => 4,
          "rnr"       => 5,
          "hnr"       => 1,
          "bnr"       => 5,
          "k"         => "H",
          "av"        => "A",
          "grundf"    => 0,
          "grundt"    => 76.68,
          "tfg"       => 0,
          "omh1f"     => 9,
          "omh1t"     => 63.87,
          "tf1"       => 1,
          "totfel"    => 9,
          "re"        => 3,
          "rid"       => true,
          "premie"    => 0,
          "premie_show" => 0,
          "result_at" => Time.now.iso8601,
          "last_result_at" => Time.now.iso8601,
          "or"        => "",
          "a"         => ""
        },
        {
          "ord"       => 1001,
          "st"        => 2,
          "rnr"       => 4,
          "hnr"       => 2,
          "bnr"       => 4,
          "k"         => "H",
          "av"        => "A",
          "grundf"    => 999,
          "grundt"    => nil,
          "tfg"       => nil,
          "omh1f"     => nil,
          "omh1t"     => nil,
          "tf1"       => nil,
          "totfel"    => 999,
          "re"        => 4,
          "rid"       => true,
          "premie"    => 0,
          "premie_show" => 0,
          "result_at" => Time.now.iso8601,
          "last_result_at" => Time.now.iso8601,
          "or"        => "D",
          "a"         => ""
        },
        {
          "ord"       => 1002,
          "st"        => 3,
          "rnr"       => 2,
          "hnr"       => 5,
          "bnr"       => 2,
          "k"         => "H",
          "av"        => "A",
          "grundf"    => nil,
          "grundt"    => nil,
          "tfg"       => nil,
          "omh1f"     => nil,
          "omh1t"     => nil,
          "tf1"       => nil,
          "totfel"    => nil,
          "re"        => 999,
          "rid"       => false,
          "premie"    => 0,
          "premie_show" => 0,
          "result_at" => Time.now.iso8601,
          "last_result_at" => Time.now.iso8601,
          "or"        => "",
          "a"         => "Ö"
        }
      ]
    }
  }

  uri = URI("#{BASE_URL}/meetings/#{MEETING_ID}/batch")
  req = Net::HTTP::Post.new(uri)
  req['X-Api-Key']           = API_KEY
  req['X-Transaction-Uuid']  = SecureRandom.uuid
  req['Accept']              = 'application/json'
  req['Content-Type']        = 'application/json'
  req.body                   = batch_payload.to_json

  res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
    http.request(req)
  end

  puts "\nPOST Batch -> Status: #{res.code}"
  if res.is_a?(Net::HTTPSuccess)
    puts "Batch update response:\n#{res.body}"
  else
    puts "Error pushing batch: #{res.body}"
  end
end

# Main flow
def main
  # 1) Fetch competitions
  get_competitions

  # 2) Fetch start list for competition kq=1
  get_start_list(1)

  # 3) Push batch update for competition kq=1 with the new JSON
  push_batch(1)
end

main
