FactoryGirl.define do
  factory :shipment_status_line_item, class: IngramMicro::ShipmentStatusLineItem do
    transient do
      line_no "WC0001"
      transaction_document_number 'some number'
      bill_of_lading 'some bill'
      customer_order_number 'customer number'
      brightpoint_order_number 'brightpoint order number'
      status_code 'status_code'
      status_date 'status_date'
      reason_code 'reason_code'
      signed_by 'signed_by'
      status_timestamp 'status_timestamp'
      comments 'some comments'
    end

    after(:build) do |ship_status_line_item, evaluator|
      ship_status_line_item.element[:line_no] = evaluator.line_no
      ship_status_line_item.element[:transaction_document_number] = evaluator.transaction_document_number
      ship_status_line_item.element[:bill_of_lading] = evaluator.bill_of_lading
      ship_status_line_item.element[:customer_order_number] = evaluator.customer_order_number
      ship_status_line_item.element[:brightpoint_order_number] = evaluator.brightpoint_order_number
      ship_status_line_item.element[:status_code] = evaluator.status_code
      ship_status_line_item.element[:status_date] = evaluator.status_date
      ship_status_line_item.element[:reason_code] = evaluator.reason_code
      ship_status_line_item.element[:signed_by] = evaluator.signed_by
      ship_status_line_item.element[:status_timestamp] = evaluator.status_timestamp
      ship_status_line_item.element[:comments] = evaluator.comments
    end
  end
end
