class PaymentMethod < ActiveRecord::Base
    attr_accessor :card_number, :card_cvv, :card_expiration_month, :card_expiration_year
    belongs_to :user
    
    def self.expiry_months
        # Date::MONTHNAMES.compact.each_with_index.map{|month,idex| [index+1, month]}
        # OR
        Date::MONTHNAMES.compact.map.with_index(0){|month,index| [month,index]}
    end
    
    def self.expiry_years
        (Date.today.year..Date.today.year+10).to_a
    end
    
    def process_payment
        # to process payment we need to create customer with token and email id of user
        Stripe.api_key = ENV["SECRET_KEY"]
        customer = Stripe::Customer.create(email: self.email, card: self.payment_token)
        
        # after creating customer create charge for the amount user wants to pay
        
        charge = Stripe::Charge.create(customer: customer.id, amount: 1000, currency: "usd", description: "Premium")
        
        
    end
end

#In this model we have used few new methods
# we chained each_with_index with map to get index value inside map

# with_index with map to get index inside block

# with_index(0) it skips index 0 and starts from 1

# with_index(1) skips 0 and 1 start with 2

