Fabricator(:shipment_information, class_name: IngramMicro::ShipmentInformation) do
  element {{ ship_first_name: Faker::Name.first_name,
             ship_last_name: Faker::Name.last_name,
             ship_middle_initial: ("A".."Z").to_a.sample,
             ship_address1: Faker::Address.street_address,
             ship_city: Faker::Address.city,
             ship_state: Faker::Address.state_abbr,
             ship_post_code: Faker::Address.zip,
             ship_country_code: Faker::Address.country_code,
             ship_phone1: Faker::PhoneNumber.phone_number,
             ship_email: Faker::Internet.email,
             ship_via: IngramMicro::ShipmentInformation::SHIPPING_METHODS.keys.sample }}
end
