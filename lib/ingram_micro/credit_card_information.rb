class IngramMicro::CreditCardInformation
  attr_accessor :credit_card_number, :credit_card_expiration_date,
    :credit_card_identification, :global_card_classification_code,
    :card_holder_name, :card_holder_address1, :card_holder_address2,
    :card_holder_city, :card_holder_state, :card_holder_post_code,
    :card_holder_country_code, :authorized_amount, :billing_sequence_number,
    :billing_authorization_response, :billing_address_match, :billing_zip_match,
    :avs_hold, :merchant_name

    def build(builder)
      builder.send("credit-card-number", credit_card_number)
      builder.send("credit-card-expiration-date", credit_card_expiration_date)
      builder.send("credit-card-identification", credit_card_identification)
      builder.send("global-card-classification-code", global_card_classification_code)
      builder.send("card-holder-name", card_holder_name)
      builder.send("card-holder-address1", card_holder_address1)
      builder.send("card-holder-address2", card_holder_address2)
      builder.send("card-holder-city", card_holder_city)
      builder.send("card-holder-state", card_holder_state)
      builder.send("card-holder-post-code", card_holder_post_code)
      builder.send("card-holder-country-code", card_holder_country_code)
      builder.send("authorized-amount", auth_amount)
      builder.send("billing-sequence-number", billing_sequence_number)
      builder.send("billing-authorization-response", billing_authorization_response)
      builder.send("billing-address-match", billing_address_match)
      builder.send("billing-zip-match", billing_zip_match)
      builder.send("avs-hold", avs_hold)
      builder.send("merchant-name", merchant_name)
    end

    def auth_amount
      authorized_amount ||= 0.00
    end

end
