Fabricator(:sales_order_purchase_order_information, class_name: IngramMicro::OutboundPurchaseOrderInformation) do
  element {{ purchase_order_number: sequence(:purchase_order_number, 00001),
  }}
end
