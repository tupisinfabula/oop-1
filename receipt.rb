require_relative 'item'

class Receipt

    attr_reader :total_taxes, :total_price

  def initialize
    @total = []
    @total_price = []
    @total_price_no_taxes = []
    @sum = 0
    @sum_total_price = 0
  end
# Calculate item price taxes included
  def sales_taxes(item)
    if (item.sales_taxes == false)
      @total = item.price
      puts "1 #{item.name} : #{@total.round(2)}"
    else
      @total = item.price * 1.10
      puts "1 #{item.name} : #{@total.round(2)}"
    end

    add(item)
  end

# Calculate imported item's price
  def import_taxes(item)
    if (item.sales_taxes == false && item.import_taxes == false)
      @total = item.price
      puts "1 #{item.name} at #{@total.round(2)}"
    elsif (item.sales_taxes == false && item.import_taxes == true)
      @total = (item.price * 1.05)
      puts "1 imported #{item.name} : #{@total.round(2)}"
    else
      @total = (item.price * 1.15)
      puts "1 imported #{item.name} : #{@total.round(2)}"
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

# Return the total price of the items without taxes
  def cart
    sum_rounding = @sum.round(2)
    sum_total_price_rounding = @sum_total_price.round(2)
    total_sum_taxes = (sum_total_price_rounding - sum_rounding).round(2)
    puts "Total excluded taxes: #{sum_rounding}"
    puts "Total included taxes: #{sum_total_price_rounding}"
    puts "Sales taxes:#{total_sum_taxes.round(2)}"
  end

end

# Create instances of Item class
book = Item.new("Book", 12.49, false, false)
cd = Item.new("music CD", 14.99, true, false)
chocolate = Item.new("Chocolate Bar", 0.85, false, false)
#Create instance of Receipt class
receipt = Receipt.new

receipt.sales_taxes(book)
receipt.sales_taxes(cd)
receipt.sales_taxes(chocolate)
# Return the total
receipt.sum_price
receipt.cart

box_chocolate = Item.new("Box of chocolate", 10.00, false, true)
perfume = Item.new("Bottle of Perfume", 47.50, true, true)

receipt_2 = Receipt.new
receipt_2.import_taxes(box_chocolate)
receipt_2.import_taxes(perfume)

#Return the total
receipt_2.sum_price
receipt_2.cart

perfume_2 = Item.new("Bottle of Perfume", 27.99, true, true)
perfume_3 = Item.new("Bottle of Perfume", 18.99, true, false)
pills = Item.new("Packet of headache pills", 9.75, false, false)
chocolates = Item.new("Box of imported chocolates", 11.25, false, true)

receipt_3 = Receipt.new
receipt_3.import_taxes(perfume_2)
receipt_3.sales_taxes(perfume_3)
receipt_3.sales_taxes(pills)
receipt_3.import_taxes(chocolates)

receipt_3.sum_price
receipt_3.cart
