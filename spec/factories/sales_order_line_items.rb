FactoryGirl.define do
  factory :sales_order_line_item, class: IngramMicro::SalesOrderLineItem do
    transient do
      line_no "WC0001"
      item_code "SKU123"
      universal_product_code "UPC098"
      product_name "Bevel Starter Kit"
      comments nil
      quantity 1.0
      unit_of_measure "EA"
      sid nil
      esn nil
      min nil
      mdn nil
      irdb nil
      imei nil
      market_id nil
      line_status nil
      base_price 89.85
      line_discount 0.0
      line_tax1 0.0
      line_tax2 0.0
      line_tax3 0.0
    end

    after(:build) do |soli, evaluator|
      soli.element[:line_no] = evaluator.line_no
      soli.element[:item_code] = evaluator.item_code
      soli.element[:universal_product_code] = evaluator.universal_product_code
      soli.element[:product_name] = evaluator.product_name
      soli.element[:comments] = evaluator.comments
      soli.element[:quantity] = evaluator.quantity
      soli.element[:unit_of_measure] = evaluator.unit_of_measure
      soli.element[:sid] = evaluator.sid
      soli.element[:esn] = evaluator.esn
      soli.element[:min] = evaluator.min
      soli.element[:mdn] = evaluator.mdn
      soli.element[:irdb] = evaluator.irdb
      soli.element[:imei] = evaluator.imei
      soli.element[:market_id] = evaluator.market_id
      soli.element[:line_status] = evaluator.line_status
      soli.element[:base_price] = evaluator.base_price
      soli.element[:line_discount] = evaluator.line_discount
      soli.element[:line_tax1] = evaluator.line_tax1
      soli.element[:line_tax2] = evaluator.line_tax2
      soli.element[:line_tax3] = evaluator.line_tax3
    end
  end
end
