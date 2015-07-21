class Item
    attr_reader :item , :price
    
    def initialize(item,price)
        @item = item
        @price = price
    end

    # items = {
    #     "vacuum_cleaner"=>150,
    #     "orange_juice"=>10,
    #     "rice"=> 1,
    #     "anchovies"=>2,
    #     "bananas"=>10
    # }
    # items.each do |key, value|
    #     if @item === key
    #         @price = value
    #     end
    # end

end

class Houseware < Item
end

class Fruit < Item
end

class Dry < Item
end

class Juice < Item
end

class Fish < Item
end


class ShoppingCart

    def initialize
        @added_items = []
    end
    
    def add (item)
        @item = item.item
        @price = item.price
        @added_items.push(item)
    end
        
    def total_cost
        @@total = 0.0
        @@discount = 0.0
        @@balance = 0.0
        
        @counts = @added_items.inject(Hash.new(0)) { |item, price| item[price] += 1 ;item} #this returns a new hash of the instances and count of the same instance

        @counts.each do |item,q| 
            @@total += (q * item.price)
            
             if item.item === "vacuum_cleaner" and item.price > 100 
                 @@discount += (q * item.price * 0.05)
                 
            elsif item.item === "banana" and (Time.now.strftime("%A") == "Saturday" || "Sunday")
                @@discount += (q * item.price * 0.10)
            end
            
        end
        
        if @added_items.length > 5
            @@discount += (@@total-@@discount)*0.1
        end
        
        @@balance = @@total - @@discount
    end

    def show
        puts "* Fruits: -10% on weekends","* $100+ Houseware: -5% discount","* -10% if you have 5+ items"
        puts
        puts "Items in your cart:"
        puts
        puts "Item".ljust(20) + "Price".rjust(10)
        puts "-" * 30
        
        @counts.each do |item, q|
            puts  "#{q} " +  (item.item).ljust(20) + sprintf("%0.2f",(item.price * q)).rjust(8)  
        end
        
        puts "-" * 30
        puts "Total:".rjust(10) + sprintf("%0.2f",@@total).rjust(20) 
        puts "Discount:".rjust(10) + sprintf("%0.2f",-@@discount).rjust(20)
        puts "Balance:".rjust(10) +  sprintf("%0.2f",@@balance).rjust(20)
        puts
        puts "Thanks for shopping with us! :)"
    end
end

cart = ShoppingCart.new
banana = Fruit.new("banana",10)
vacuum = Houseware.new("vacuum_cleaner",150)
orange_juice = Juice.new("orange_juice",10)
rice = Dry.new("rice",1)
anchovies = Fish.new("anchovies",2)

cart.add(banana)
cart.add(anchovies)
cart.add(orange_juice)
cart.add(rice)
cart.add(banana)
cart.add(vacuum)

cart.total_cost
cart.show

