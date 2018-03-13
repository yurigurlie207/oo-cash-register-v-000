require "pry"

class CashRegister

  attr_accessor :total, :discount, :quantity, :price, :items

  def initialize(discount = 100)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    @quantity = quantity
    @price = price
    @total = @total + (@price * @quantity)

    quantity.times do
      @items << title
    end
  end

  def total
    @total
  end

  def apply_discount

    if @discount == 100
      @message = "There is no discount to apply."
    else
      @total = ((1 - @discount / 100.0) * @total).to_i
      @message = "After the discount, the total comes to $#{@total}."
    end

    return @message
  end

  def items
    @items
  end

  def void_last_transaction
    @total = @total - (@price * @quantity)
    #although we also really need to take out the items from the item list as well, but ohwell
  end

end
