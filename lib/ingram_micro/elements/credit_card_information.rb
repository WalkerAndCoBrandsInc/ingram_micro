class IngramMicro::CreditCardInformation < IngramMicro::BaseElement
  DEFAULTS = {
    credit_card_number: nil,
    credit_card_expiration_date: nil,
    credit_card_identification: nil,
    global_card_classification_code: nil,
    card_holder_name: nil,
    card_holder_address1: nil,
    card_holder_address2: nil,
    card_holder_city: nil,
    card_holder_state: nil,
    card_holder_post_code: nil,
    card_holder_country_code: nil,
    billing_sequence_number: nil,
    billing_authorization_response: nil,
    billing_address_match: nil,
    billing_zip_match: nil,
    avs_hold: nil,
    merchant_name: nil
  }

  def defaults
    DEFAULTS
  end
end
