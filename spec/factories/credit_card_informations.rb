FactoryGirl.define do
  factory :credit_card_information, class: IngramMicro::CreditCardInformation do
    transient do
      credit_card_number "8617338279172675"
      credit_card_expiration_date "201810"
      credit_card_identification "671"
      global_card_classification_code nil
      card_holder_name "The Dude"
      card_holder_address1 "606 Venezia Ave Apt B"
      card_holder_address2 nil
      card_holder_city "Venice"
      card_holder_state "CA"
      card_holder_post_code "90291"
      card_holder_country_code "USA"
      authorized_amount 36.90
      billing_sequence_number nil
      billing_authorization_response nil
      billing_address_match "Y"
      billing_zip_match "Y"
      avs_hold nil
      merchant_name "walker"
    end
    after(:create) do |cc_info, evaluator|
      cc_info.element[:credit_card_number] = evaluator.credit_card_number
      cc_info.element[:credit_card_expiration_date] = evaluator.credit_card_expiration_date
      cc_info.element[:credit_card_identification] = evaluator.credit_card_identification
      cc_info.element[:global_card_classification_code] = evaluator.global_card_classification_code
      cc_info.element[:card_holder_name] = evaluator.card_holder_name
      cc_info.element[:card_holder_address1] = evaluator.card_holder_address1
      cc_info.element[:card_holder_address2] = evaluator.card_holder_address2
      cc_info.element[:card_holder_city] = evaluator.card_holder_city
      cc_info.element[:card_holder_state] = evaluator.card_holder_state
      cc_info.element[:card_holder_post_code] = evaluator.card_holder_post_code
      cc_info.element[:card_holder_country_code] = evaluator.card_holder_country_code
      cc_info.element[:authorized_amount] = evaluator.authorized_amount
      cc_info.element[:billing_sequence_number] = evaluator.billing_sequence_number
      cc_info.element[:billing_authorization_response] = evaluator.billing_authorization_response
      cc_info.element[:billing_address_match] = evaluator.billing_address_match
      cc_info.element[:billing_zip_match] = evaluator.billing_zip_match
      cc_info.element[:avs_hold] = evaluator.avs_hold
      cc_info.element[:merchant_name] = evaluator.merchant_name
    end
  end
end
