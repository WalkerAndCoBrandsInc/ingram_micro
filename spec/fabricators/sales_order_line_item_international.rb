Fabricator(:sales_order_line_item_international, class_name: IngramMicro::SalesOrderLineItem) do
  element {{ line_no: sequence(:line_no, 00001),
             item_code: Faker::Code.isbn,
             universal_product_code: Faker::Code.isbn,
             product_name: Faker::Commerce.product_name,
             comments: Faker::Lorem.sentence,
             quantity: (1..10).to_a.sample.to_f,
             unit_of_measure: ["EA", "PT", "CT"].sample,
             min: Faker::Code.isbn,
             sid: Faker::Code.isbn,
             esn: Faker::Code.isbn,
             imei: Faker::Code.isbn,
             mdn: Faker::Code.isbn,
             irdb: Faker::Code.isbn,
             market_id: Faker::Code.isbn,
             line_status: Faker::Lorem.sentence,
             base_price: Faker::Commerce.price,
             line_discount: Faker::Commerce.price,
             line_tax1: Faker::Commerce.price,
             line_tax2: Faker::Commerce.price,
             line_tax3: Faker::Commerce.price,
             line_name_value: {
               international_eccn_value: "1A001",
               international_declared_value: Faker::Commerce.price,
               warranty_item: "false",
               international_country_of_origin: Faker::Address.country_code,
               international_license_value: Faker::Commerce.price,
               hts_code: "0000.00000.00"
             }
              }}
end
