class IngramMicro::SalesOrderSubmission

  def self.build(builder, customer, shipment_information, credit_card_information, order_header, detail)
    builder.send("header") do
        builder.send "customer-id", 123456
        builder.send "business-name", "MegaGloboCo"
        builder.send "carrier-name", "FEDEX"
        builder.send("customer-information") do
          customer.build(builder)
        end
        builder.send("shipment-information") do
          shipment_information.build(builder)
        end
        builder.send("credit-card-information") do
          credit_card_information.build(builder)
        end
        builder.send("order-header") do
          order_header.build(builder)
        end
      end
      builder.detail do
        detail.build(builder)
      end
  end

end
