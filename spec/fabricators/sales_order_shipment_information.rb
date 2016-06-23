Fabricator(:sales_order_shipment_information, class_name: IngramMicro::SalesOrderShipmentInformation) do
  element { Fabricate.build(:shipment_information).element.merge({
    ship_no_later: Faker::Date.ingram_date_range,
    no_ship_before: Faker::Date.ingram_date_range,
    dock_date: Faker::Date.ingram_date_range,
    ship_to_code: Faker::Code.ean
  })}
end
