module IngramMicro
  class SalesOrderStatus < InboundBaseElement
    def status_hash
      @status_hash ||= extract_status_hash
    end

    def extract_status_hash
      if transaction_name == 'sales-order-success'
        hash['message']['sales_order_success']
      elsif transaction_name == 'sales-order-submission'
        hash['message']['sales_order_submission']
      else
        hash['message']['sales_order_rejection']
      end
    end

    def customer_id
      status_hash['header']['customer_id']
    end

    def shipment_information
      shipment_information_hash = status_hash['header']['shipment_information']
      IngramMicro::InboundShipmentInformation.new(shipment_information_hash)
    end

    def purchase_order_information
      po_information_hash = status_hash['header']['purchase_order_information']
      IngramMicro::InboundPurchaseOrderInformation.new(po_information_hash)
    end

    def order_header
      order_header_hash = status_hash['header']['order_header']
      IngramMicro::InboundOrderHeader.new(order_header_hash)
    end

    def detail
      detail_hash = status_hash['detail']
      IngramMicro::InboundDetail.new(detail_hash)
    end
  end
end
