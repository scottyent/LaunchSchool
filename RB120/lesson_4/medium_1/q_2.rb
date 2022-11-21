# Alan created the following code to keep track of items for a
# shopping cart application he's writing:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    @quantity = updated_count if updated_count >= 0
  end
end

# Alyssa looked at the code and spotted a mistake.
# "This will fail when update_quantity is called", she says.

# Can you spot the mistake and how to address it?
# As mentioned in the previous exercise, you need to call  @ in order
# to actually change the value, otherwise it just treats it like a local
# variable and won't actually update the instance variable quantity.
# Also, because there is only a getter method set (attr_reader), you can't use
# self.quantity. You could change it to an attr_accessor and make it self