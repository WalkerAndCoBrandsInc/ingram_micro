Fabricator(:sales_order_header_international, class_name: IngramMicro::SalesOrderHeader) do
  element {{ cutomer_order_number: Faker::Code.isbn,
    order_sub_total: Faker::Commerce.price,
    order_shipment_charge: Faker::Commerce.price,
    order_total_net: Faker::Commerce.price,
    order_discount: Faker::Commerce.price,
    order_tax1: Faker::Commerce.price,
    order_tax2: Faker::Commerce.price,
    order_tax3: Faker::Commerce.price,
    header_name_value: {
      international_duties_and_taxes_billing_to: %w(E I C).sample,
      international_freight_billing_to: Faker::Company.name,
      international_freight_account: Faker::Code.isbn.to_s,
      international_incoterm: "ABC",
      international_importer_of_record_email: Faker::Internet.email,
      international_importer_of_record_phone_number: Faker::PhoneNumber.phone_number,
      international_importer_of_record_country_code: "US",
      international_importer_of_record_zipcode: Faker::Address.zip,
      international_importer_of_record_state: Faker::Address.state,
      international_importer_of_record_city: Faker::Address.city,
      international_importer_of_record_address3: "",
      international_importer_of_record_address2: "",
      international_importer_of_record_address1: Faker::Address.street_address,
      international_importer_of_record_name: Faker::Name.first_name
    }
  }}
end
