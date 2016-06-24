Fabricator(:check_shipment_status, class_name: IngramMicro::CheckShipmentStatus) do
  business_name { Faker::Business.name }
  customer_id { (0..10).to_a.sample }
  line_items { [Fabricate.build(:shipment_status_line_item)] }
end

