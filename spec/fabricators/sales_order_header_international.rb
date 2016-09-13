Fabricator(:sales_order_header_international, class_name: IngramMicro::SalesOrderHeader) do
  element {{ cutomer_order_number: Faker::Code.isbn,
    order_sub_total: Faker::Commerce.price,
    order_shipment_charge: Faker::Commerce.price,
    order_total_net: Faker::Commerce.price,
    order_discount: Faker::Commerce.price,
    order_tax1: Faker::Commerce.price,
    order_tax2: Faker::Commerce.price,
    order_tax3: Faker::Commerce.price,
    header_name_value:[
      ["international-duties-and-taxes-billing-to", %w(E I C).sample],
      ["international-freight-billing-to", Faker::Company.name],
      ["international-freight-account", Faker::Code.isbn.to_s],
      ["international-incoterm", "ABC"],
      ["international-importer-of-record-email", Faker::Internet.email],
      ["international-importer-of-record-phone-number", Faker::PhoneNumber.phone_number],
      ["international-importer-of-record-country-code", "US"],
      ["international-importer-of-record-zipcode", Faker::Address.zip],
      ["international-importer-of-record-state", Faker::Address.state],
      ["international-importer-of-record-city", Faker::Address.city],
      ["international-importer-of-record-address3", ""],
      ["international-importer-of-record-address2", ""],
      ["international-importer-of-record-address1", Faker::Address.street_address],
      ["international-importer-of-record-name", Faker::Name.first_name]
    ]
  }}
end
