Fabricator(:shipment_status_line_item, class_name: IngramMicro::ShipmentStatusLineItem) do
  element {{line_no: sequence(:line_no, 00001),
            transaction_document_number: Faker::Code.ean,
            bill_of_lading: Faker::Bitcoin.address,
            customer_order_number: Faker::Code.isbn,
            brightpoint_order_number: Faker::Code.isbn,
            status_code: Faker::Code.ean,
            status_date: Faker::Date.ingram_date_range,
            reason_code: Faker::Code.ean,
            signed_by: Faker::Name.name,
            status_timestamp: Faker::Time.ingram_timestamp,
            comments: Faker::Lorem.sentence }}
end
