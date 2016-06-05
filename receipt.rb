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
    if (item.name == 'Book' || item.name == 'Food' || item.name == 'Medical')
      @total = item.price
      puts "1 #{item.name} at #{@total}"
    else
      @total = item.price * 1.10
      puts "1 #{item.name} at #{@total}"
    end

    add(item)
  end

# Calculate imported item's price
  def import_taxes(item)
    if ((item.name == 'Book' || item.name == 'Food' || item.name == 'Medical') && item.import_taxes == false)
      @total = item.price
      puts "1 #{item.name} at #{@total}"
    elsif ((item.name == 'Book' || item.name == 'Food' || item.name == 'Medical') && item.import_taxes == true)
      @total = item.price * 1.05
      puts "1 imported #{item.name} at #{@total}"
    else
      @total = item.price * 1.15
      puts "1 imported #{item.name} at #{@total}"
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
    puts "Total excluding taxes: #{@sum.to_f}"
    puts "Total included taxes: #{@sum_total_price.to_f}"
    puts "Sales_taxes:#{@sum_total_price.to_f - @sum}"
  end



end

# Create instances of Item class
book = Item.new("Book", 10, false, false)
food = Item.new("Food", 30, false, true)
cd = Item.new("Cd", 20, true, true)

# Create instance of Receipt class
receipt = Receipt.new

receipt.sales_taxes(book)
receipt.import_taxes(book)

receipt.sales_taxes(food)
receipt.import_taxes(food)

receipt.sales_taxes(cd)
receipt.import_taxes(cd)

receipt.sum_price
receipt.cart
