Fabricator(:return_authorization, class_name: IngramMicro::ReturnAuthorization) do
  customer { Fabricate.build(:customer) }
  credit_card_information { Fabricate.build(:credit_card_information) }
  order_header { IngramMicro::ReturnAuthorizationOrderHeader.new(customer_order_number: "RA111") }
  shipment_information { Fabricate.build(:return_authorization_shipment_information) }
  detail { IngramMicro::Detail.new(line_items:[Fabricate.build(:return_authorization_line_item)]) }
  return_authorization_id "RA111"
end
