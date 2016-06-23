Fabricator(:shipment_status, class_name: IngramMicro::ShipmentStatus) do
  element {{ customer_id: Faker::Lorem.word,
             business_name: Faker::Superhero.name,
             detail: Faker::Lorem.sentence,
             line_items: [] }}
end

