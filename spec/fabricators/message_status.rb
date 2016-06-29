Fabricator(:message_status, class_name: IngramMicro::MessageStatus) do
  element {{
    status_code: 1,
    status_description: Faker::Lorem.sentence,
    comments: Faker::Lorem.sentence,
    response_timestamp: Time.now.strftime('%Y%m%d%H%M%S'),
    filename: Faker::Lorem.sentence
  }}
end
