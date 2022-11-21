# In the last question Alan showed Alyssa this code which keeps track of
# items for a shopping cart application:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    self.quantity = updated_count if updated_count >= 0
  end

  private
  attr_writer :quantity
end

# Alyssa noticed that this will fail when update_quantity is called.
# Since quantity is an instance variable, it must be accessed
# with the @quantity notation when setting it. One way to fix this is to change
# attr_reader to attr_accessor and change quantity to self.quantity.

# Is there anything wrong with fixing it this way?
# Yes, because you effectively expose a way to change the quantity to the
# outside. You could leave it as @quantity, or even better, put the writer
# in a private section so that it's only available within the class, and so
# you can't directly set it from the outside, but you can still use the
# update_quantity method.

bill = InvoiceEntry.new("Apple", 5)
p bill
bill.update_quantity(8)
p bill