# Create a module named Transportation that contains three classes:
# Vehicle, Truck, and Car. Truck and Car should both inherit from Vehicle.

module Transportation
  class Vehicle
  end

  class Truck < Vehicle
    def honk
      puts "HONKKKKK HONKKKK"
    end
  end

  class Car < Vehicle
  end
end


tonka = Transportation::Truck.new
tonka.honk
