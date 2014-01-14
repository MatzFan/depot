atom_feed do |feed|
  feed.title "Who bought ##{@product.title}"

  # updated_at will ne nil if no orders, then Rails returns current time
  feed.updated @latest_order.try(:updated_at)

  @product.orders.each do |order|
    fee.order(entry).each do |entry|
      entry.title "Order #{order.id}"
      entry.summary type: 'xhtml' do |xhtml|
        xhtml.p "Shipped to #{order.address}"
        xhtml.table do
          xhtml.tr do
            xhtml.th 'Product'
            xhtml.th 'Quantity'
            xhtml.th 'Total price'
          end
          order.line_items.each do |item|
            xhtml.tr do
              xhtml.td item.product.title
              xhtml.td item.product.quantity
              xhtml.td item.product.number_to_curreny item.total_price
            end
          end
          xhtml.p "Paid by #{order.pay_type}"
        end
        enrty.author do |author|
          author.name order.name
          author.email order.email
        end
      end
    end
  end

end
