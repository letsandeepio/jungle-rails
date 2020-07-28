# frozen_string_literal: true

require 'mailgun'

class EmailReceipt < ActionMailer::Base
  def send_email(order)
    @order = Order.find(order.id)
    @products_order = @order.line_items.map { |line_item| "<li>#{line_item.product.name}</li>" }.join(',')
    @product_price = "$#{order.total_cents / 100}"
    mg_client = Mailgun::Client.new ENV['MAIL_GUN_API']

    html = "<body><p>Dear Customer,<br>Your order has been successfully placed. Products Ordered. <ul>#{@products_order}</ul> Total Cost: #{@product_price}</p></body>"

    puts html
    # Define your message parameters
    message_params = { from: ENV['MAIL_GUN_SENDER'],
                       to: 'sandeep.chopra@live.com',
                       subject: "Jungle.com - Order #{order.id} cofirmed successfully!",
                       html: html }

    # Send your message through the client
    mg_client.send_message ENV['MAIL_GUN_DOMAIN'], message_params

    puts '####email sent##########'
  end
end
