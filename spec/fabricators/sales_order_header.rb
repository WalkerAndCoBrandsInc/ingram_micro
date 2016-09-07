Fabricator(:sales_order_header, class_name: IngramMicro::SalesOrderHeader) do
  element {{ cutomer_order_number: Faker::Code.isbn,
    order_sub_total: Faker::Commerce.price,
    order_shipment_charge: Faker::Commerce.price,
    order_total_net: Faker::Commerce.price,
    order_discount: Faker::Commerce.price,
    order_tax1: Faker::Commerce.price,
    order_tax2: Faker::Commerce.price,
    order_tax3: Faker::Commerce.price,
    header_name_values: [
      ["international-incoterm","DDP"],
      ["international-importer-of-record-city","Vancouver"]
    ]
  }}
end
