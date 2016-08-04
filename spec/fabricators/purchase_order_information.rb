Fabricator(:purchase_order_information, class_name: IngramMicro::OutboundPurchaseOrderInformation) do
  element {{purchase_order_number: (10000..99999).to_a.sample,
            account_description: nil,
            purchase_order_amount: 0.0,
            purchase_order_event: nil,
            currency_code: nil,
            comments: nil}}
end
