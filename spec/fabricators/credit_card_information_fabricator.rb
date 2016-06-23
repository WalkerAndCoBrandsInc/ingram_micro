Fabricator(:credit_card_information, class_name: :'IngramMicro::CreditCardInformation') do
  element {{ credit_card_number: "8617338279172675",
             credit_card_expiration_date: "201810",
             credit_card_identification: "671",
             global_card_classification_code: nil,
             card_holder_name: "The Dude",
             card_holder_address1: "606 Venezia Ave Apt B",
             card_holder_address2: nil,
             card_holder_city: "Venice",
             card_holder_state: "CA",
             card_holder_post_code: "90291",
             card_holder_country_code: "USA",
             authorized_amount: 36.90,
             billing_sequence_number: nil,
             billing_authorization_response: nil,
             billing_address_match: "Y",
             billing_zip_match: "Y",
             avs_hold: nil,
             merchant_name: "walker" }}
end

