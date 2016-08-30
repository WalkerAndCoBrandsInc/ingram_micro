class IngramMicro::SalesOrderHeader < IngramMicro::BaseElement

  DEFAULTS = {
    customer_order_number: 0,
    customer_order_date: nil,
    order_sub_total: 0.0,
    order_discount: 0.0,
    order_tax1: 0.0,
    order_tax2: 0.0,
    order_tax3: 0.0,
    order_shipment_charge: 0.0,
    order_total_net: 0.0,
    order_status: nil,
    order_type: nil,
    gift_flag: nil,
    customer_channel_type: nil,
    customer_group_account: nil,
    customer_seller_code: nil,
    packing_slip_format: nil,
    special_header_message: nil
  }

  format :customer_order_date, IngramMicro::DateFormatter.new

  def defaults
    DEFAULTS
  end

  def international_header_name_value
  end

  HEADER_ATTRIBUTE_NAMES = [
    "international_duties_and_taxes_billing_to",
    "international_freight_billing_to",
    "international_freight_account",
    "international_incoterm",
    "international_importer_of_record_email",
    "international_importer_of_record_phone_number",
    "international_importer_of_record_country_code",
    "international_importer_of_record_zipcode",
    "international_importer_of_record_state",
    "international_importer_of_record_city",
    "international_importer_of_record_address3",
    "international_importer_of_record_address2",
    "international_importer_of_record_address1",
    "international_importer_of_record_name"
  ].freeze
end
