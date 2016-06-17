FactoryGirl.define do
  factory :shipment_information, class: IngramMicro::ShipmentInformation do
    transient do
      ship_first_name "Jeffrey"
      ship_last_name "Lebowsky"
      ship_middle_initial "D"
      ship_address1 "606 Venezia Ave Apt B"
      ship_city "Venice"
      ship_state "CA"
      ship_post_code "90291"
      ship_country_code "USA"
      ship_phone1 "213-371-9147"
      ship_email "the_dude@yahoo.com"
      ship_via "FX01"
    end
    after(:build) do |shipment_information, evaluator|
      shipment_information.element[:ship_first_name] = evaluator.ship_first_name
      shipment_information.element[:ship_last_name] = evaluator.ship_last_name
      shipment_information.element[:ship_middle_initial] = evaluator.ship_middle_initial
      shipment_information.element[:ship_address1] = evaluator.ship_address1
      shipment_information.element[:ship_city] = evaluator.ship_city
      shipment_information.element[:ship_state] = evaluator.ship_state
      shipment_information.element[:ship_post_code] = evaluator.ship_post_code
      shipment_information.element[:ship_country_code] = evaluator.ship_country_code
      shipment_information.element[:ship_phone1] = evaluator.ship_phone1
      shipment_information.element[:ship_email] = evaluator.ship_email
      shipment_information.element[:ship_via] = evaluator.ship_via
    end
  end
end
