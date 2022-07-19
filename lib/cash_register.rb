class CashRegister
     attr_accessor :total, :discount, :last_item, :items

    def initialize(emp_discount=0)
        @discount = emp_discount
        @total = 0
        @items = []
    end

    def add_item(title, price, quantity = 1)
        @last_item = price * quantity
        self.total+= (price * quantity)
        quantity.times {self.items << title}
    end

    def apply_discount
        if @discount > 0
            discount_percent = (100.0 - self.discount.to_f)/100
            self.total= (self.total * discount_percent).to_i
            "After the discount, the total comes to $#{self.total}."
        else
            'There is no discount to apply.'
        end
    end

    def void_last_transaction
        self.total -= last_item
    end

end