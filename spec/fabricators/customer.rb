Fabricator(:customer, class_name: IngramMicro::Customer) do
  element {{ customer_first_name: Faker::Name.first_name,
             customer_last_name: Faker::Name.last_name,
             customer_address1: Faker::Address.street_address,
             customer_city: Faker::Address.city,
             customer_state: Faker::Address.state,
             customer_post_code: Faker::Address.zip,
             customer_phone: Faker::PhoneNumber.phone_number,
             customer_email: Faker::Internet.email }}
end
