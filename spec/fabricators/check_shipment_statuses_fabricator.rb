Fabricator(:check_shipment_statuses, class_name: :'IngramMicro::CheckShipmentStatus') do
  element {{ shipment_status: Fabricate(:shipment_status) }}
end

