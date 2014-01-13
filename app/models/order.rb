class Order < ActiveRecord::Base
  PAYMENT_TYPES = ['Cheque', 'Credit Card', 'Purchase Order']
end
