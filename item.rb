class Item

  # To access in these variable from Receipt class
  attr_accessor :name, :price, :sales_taxes, :import_taxes

  def initialize(name, price, sales_taxes, import_taxes)
    @name = name
    @price = price
    @sales_taxes = sales_taxes
    @import_taxes = import_taxes
  end

end
