require_relative 'item'

class Receipt

    attr_reader :total_taxes, :total_price

  def initialize
    @total = []
    @total_price = []
    @total_price_no_taxes = []
    @sum = 0
    @sum_total_price = 0
    @round = 0
  end
# Calculate item price taxes included
  def sales_taxes(item)
    if (item.sales_taxes == false)
      @total = item.price
      puts "1 #{item.name} at #{@total.to_f.round(2)}"
    else
      @total = item.price * 1.10
      puts "1 #{item.name} at #{@total.to_f.round(2)}"
    end

    add(item)
  end

# Calculate imported item's price
  def import_taxes(item)
    if ((item.name == 'Book' || item.name == 'Food' || item.name == 'Medical') && item.import_taxes == false)
      @total = item.price
      puts "1 #{item.name} at #{@total.to_f.round(2)}"
    elsif ((item.name == 'Book' || item.name == 'Food' || item.name == 'Medical') && item.import_taxes == true)
      @total = item.price * 1.05
      puts "1 imported #{item.name} at #{@total.to_f.round(2)}"
    else
      @total = item.price * 1.15
      puts "1 imported #{item.name} at #{@total.to_f.round(2)}"
    end
    # Call method add
    add(item)
  end

# Add items into an array
  def add(item)
    if item.is_a?(Item)
      @total_price_no_taxes << item.price
      @total_price << @total
    else
      raise "Error in method add"
    end
  end


# Sum of all items in the array
  def sum_price
    @total_price_no_taxes.each do |x|
      @sum += x
    end

    @total_price.each do |x|
      @sum_total_price += x
    end
  end

# Print the total price of the items without taxes
  def cart
    sum_rounding = @sum.to_f.round(2)
    sum_total_price_rounding = @sum_total_price.to_f.round(2)
    total_sum_taxes = (sum_total_price_rounding - sum_rounding).to_f.round(2)
    puts "Total excluded taxes: #{sum_rounding}"
    puts "Total included taxes: #{sum_total_price_rounding}"
    puts "Sales taxes:#{total_sum_taxes}"
  end

end

# Create instances of Item class
book = Item.new("Book", 12.49, false, false)
cd = Item.new("music CD", 14.99, true, false)
chocolate = Item.new("Chocolate Bar", 0.85, false, false)
# Create instance of Receipt class
receipt = Receipt.new

receipt.sales_taxes(book)
receipt.sales_taxes(cd)
receipt.sales_taxes(chocolate)
# Return the total
receipt.sum_price
receipt.cart

box_chocolate = Item.new("Box of chocolate", 10.00, false, true)
perfume = Item.new("Bottle of Perfume", 47.50, true, true)

receipt.import_taxes(box_chocolate)
receipt.import_taxes(perfume)

# Return the total
receipt.sum_price
receipt.cart
