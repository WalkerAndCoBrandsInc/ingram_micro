FactoryGirl.define do
  factory :check_shipment_status, class: IngramMicro::CheckShipmentStatus do
    transient do
    end
    after(:build) do |info, evaluator|
      info.element[:stipment_status] = shipment_status
    end
  end
end
