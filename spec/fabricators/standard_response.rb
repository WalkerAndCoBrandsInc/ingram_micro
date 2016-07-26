Fabricator(:standard_response, class_name: IngramMicro::StandardResponse) do
  transaction_name { 'standard-response' }
  status_code { 1 }
  status_description { Faker::Lorem.sentence }
  comments { Faker::Lorem.sentence }
  response_timestamp { Time.now.strftime('%Y%m%d%H%M%S') }
  filename { Faker::Lorem.sentence }
end
