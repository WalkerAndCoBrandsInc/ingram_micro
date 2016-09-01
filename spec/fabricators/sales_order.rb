Fabricator(:sales_order, class_name: IngramMicro::SalesOrder) do
  carrier_name { IngramMicro::SalesOrderShipmentInformation::SHIPPING_METHODS.values.sample }
  business_name { Faker::Company.name }
  customer { Fabricate.build(:customer) }
  credit_card_information { Fabricate.build(:credit_card_information) }
  sales_order_header { Fabricate.build(:sales_order_header)}
  sales_order_shipment_information { Fabricate.build(:sales_order_shipment_information) }
  detail { IngramMicro::Detail.new(line_items: [Fabricate.build(:sales_order_line_item)])}
end
