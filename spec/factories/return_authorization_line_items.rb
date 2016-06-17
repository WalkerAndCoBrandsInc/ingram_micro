FactoryGirl.define do
  factory :return_authorization_line_item, class: IngramMicro::ReturnAuthorizationLineItem do
    transient do
      line_no "WC0001"
      item_code "SKU123"
      universal_product_code "UPC098"
      product_name "Bevel Starter Kit"
      comments nil
      quantity 1.0
      unit_of_measure "EA"
      min nil
      sid nil
      esn nil
      imei nil
      market_id nil
      line_status nil
      base_price 89.95
      line_discount 0.0
      line_tax1 0.0
      line_tax2 0.0
      line_tax3 0.0
      ship_date "20160606"
      failure_date nil
      failure_description nil
    end
    after(:build) do |ra_line_item, evaluator|
      ra_line_item.element[:line_no] = evaluator.line_no
      ra_line_item.element[:item_code] = evaluator.item_code
      ra_line_item.element[:universal_product_code] = evaluator.universal_product_code
      ra_line_item.element[:product_name] = evaluator.product_name
      ra_line_item.element[:comments] = evaluator.comments
      ra_line_item.element[:quantity] = evaluator.quantity
      ra_line_item.element[:unit_of_measure] = evaluator.unit_of_measure
      ra_line_item.element[:min] = evaluator.min
      ra_line_item.element[:sid] = evaluator.sid
      ra_line_item.element[:esn] = evaluator.esn
      ra_line_item.element[:imei] = evaluator.imei
      ra_line_item.element[:market_id] = evaluator.market_id
      ra_line_item.element[:line_status] = evaluator.line_status
      ra_line_item.element[:base_price] = evaluator.base_price
      ra_line_item.element[:line_discount] = evaluator.line_discount
      ra_line_item.element[:line_tax1] = evaluator.line_tax1
      ra_line_item.element[:line_tax2] = evaluator.line_tax2
      ra_line_item.element[:line_tax3] = evaluator.line_tax3
      ra_line_item.element[:ship_date] = evaluator.ship_date
      ra_line_item.element[:failure_date] = evaluator.failure_date
      ra_line_item.element[:failure_description] = evaluator.failure_description
    end
  end
end
