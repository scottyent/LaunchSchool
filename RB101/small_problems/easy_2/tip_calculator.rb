# Input: the bill, and the tip percentage
# Output: The tip amount, and the total amount

# Rules
# You don't know what you'll get in the input, so try to validate some stuff
# Display two sentences explaining what the tip and the total is separately

# Algo
# Create a method for getting the bill :DONE
# # Create a variable called bill :DONE
# # Ask for user input :DONE
# # loop until it's valid :DONE
# # return it to the main program :DONE
# Create a method for getting the percentage :DONE
# # Create a variable called tip_percentage:DONE
# # Ask user for input :DONE
# # Loop until it's valid :DONE
# # return to the main program :DONE
# Create a calculate outcome method, accepting tip and percentage, then pass it to a method to display

def ask_for_bill_total()
  bill = 0
  loop do
    puts "What is the total bill?"
    bill = gets.chomp
    if bill.include?(".")
      bill = bill.to_f.round(2)
    else
      bill = bill.to_i
    end
    break if bill != 0
    puts "Please enter a valid bill amount larger than 0 (only numbers)"
  end
  bill
end


def ask_for_tip_percentage()
  tip_percent = 0
  loop do
    puts "How much tip do you want to leave (without the percentage sign)?"
    tip_percent = gets.chomp
    if tip_percent.include?(".")
      tip_percent = tip_percent.to_f.round(2)
    else
      tip_percent = tip_percent.to_i
    end
    break if tip_percent != 0
    puts "Please enter a valid tip larger than 0"
  end
  tip_percent.to_f / 100
end

def calculate_amounts(tip_percent, bill)
  tip = bill * tip_percent
  total = bill + tip
  return tip, total
end

# Main Program

bill = ask_for_bill_total()
tip_percent = ask_for_tip_percentage()

tip, total = calculate_amounts(tip_percent, bill)

puts <<-MSG
The tip is $#{'%.2f' % tip.round(2)}.
The total is $#{'%.2f' % total.round(2)}.
MSG