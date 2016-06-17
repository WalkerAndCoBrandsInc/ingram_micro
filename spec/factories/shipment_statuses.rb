FactoryGirl.define do
  factory :shipment_status, class: IngramMicro::ShipmentStatus do
    transient do
      customer_id 'customer id'
      business_name '123123'
      detail 'detail'
      line_items []
    end
    after(:create) do |info, evaluator|
      info.element[:customer_id] = evaluator.customer_id
      info.element[:business_name] = evaluator.business_name
      info.element[:detail] = evaluator.detail
      info.element[:line_items] = evaluator.line_items
    end
  end
end

