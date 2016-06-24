Fabricator(:return_authorization_order_header, class_name: IngramMicro::ReturnAuthorizationOrderHeader) do
  element {{ customer_order_number: Faker::Code.ean,
  order_sub_total: Faker::Commerce.price,
  order_shipment_charge: Faker::Commerce.price,
  order_total_net: Faker::Commerce.price,
  customer_id: (1..10).to_a.sample,
  order_discount: Faker::Commerce.price,
  order_tax1: Faker::Commerce.price,
  order_tax2: Faker::Commerce.price,
  order_tax3: Faker::Commerce.price }}
end
