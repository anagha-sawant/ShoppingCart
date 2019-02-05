class Shop
	attr_accessor :product_array

	def initialize
	 	@product_array = []
	end

	def add_product_to_main_list
		if(!@product_array.empty?)
			puts "category"+"\t"+"product_id"+"\t"+"product_name"+"\t"+"cost_price"+"\t"+"tax"+"\t"+"discount"+"\t"+"saling_price"+"\t"+"quantity"
			@product_array.each do |i|
				puts "#{i.cat_name[:cat_name]}\t\t#{i.prod_id}\t\t#{i.prod_name}\t\t#{i.cost_price}\t\t#{i.tax}\t\t#{i.discount}\t\t#{i.saling_price}\t\t#{i.quantity}"
			end
		end
		item = Product.new
		item.add_products_info
		@product_array << item
	end

	def display_main_product_list
		puts "category"+"\t"+"product_id"+"\t"+"product_name"+"\t"+"cost_price"+"\t"+"tax"+"\t"+"discount"+"\t"+"saling_price"+"\t"+"quantity"
			@product_array.each do |i|
				puts "#{i.cat_name[:cat_name]}\t\t#{i.prod_id}\t\t#{i.prod_name}\t\t#{i.cost_price}\t\t#{i.tax}\t\t#{i.discount}\t\t#{i.saling_price}\t\t#{i.quantity}"
			end
	end

	def remove_product_from_main_list
		more = true
		while more == true
			puts "Remove product from main list"
			delete_item = gets.chomp.to_i
			@product_array.delete_at(delete_item-1) 
			puts "Do you want to remove more products : Type c or n"
			c = gets.chomp.to_i
			if c!= "c"
		        more = false
		    end
		end
	end
end

class Categories
	attr_accessor :category
	
	def initialize
		@category = []
		puts @category

		cat_id = [1,2,3,4,5]
		cat_name = ["Clothing","Books","Home","Shoe","Cosmetic & Body care"]

		cat_id.each_with_index do |id, index|
		cat_hash = {
			cat_id: id,
			cat_name: cat_name[index]
		}
		@category.push(cat_hash)
		end
		puts "cat_id"+"\t"+"cat_name"
		@category.each do |i|
			puts "#{i[:cat_id]}\t#{i[:cat_name]}"
		end
	end
end

class Product
	attr_accessor :prod_id, :prod_name, :cost_price, :saling_price, :quantity, :tax, :discount_percent, :discount, :categary, :cat_name

	def add_products_info
		@categary = Categories.new
		puts "Select category"
		cat = gets.chomp.to_i
		if(cat == 0 || cat >= 6)
			puts "invalid option"

		else
			@cat_name = @categary.category.at(cat-1)#
			puts "Category name #{cat_name}"
		end
		puts "Enter product id"
		@prod_id = gets.chomp.to_i
		puts "Enter name of product"
		@prod_name = gets.chomp
		puts "Cost price of product"
		@cost_price = gets.chomp.to_i
		puts "Discount percent"
		@discount_percent = gets.chomp.to_i
		puts "Discounted price of product"
		@discount = @cost_price * @discount_percent / 100
		puts @discount
		puts "Tax on product"
		@tax = gets.chomp.to_i
		puts "Saling price"
		@saling_price = @cost_price - @discount + @tax
		puts saling_price
		puts "Quantity of product"
		@quantity = gets.chomp.to_i
	end
end

class Cart
	
	def initialize
		@wish_list = []
	end

	def add_product_to_wish_list(shopObject)
		more = true
		while more == true
			puts "Select product"
			i = gets.chomp.to_i
			mainProduct = shopObject.product_array.at(i)
			#p mainProduct
			puts "category"+"\t"+"product_id"+"\t"+"product_name"+"\t"+"cost_price"+"\t"+"tax"+"\t"+"discount"+"\t"+"saling_price"+"\t"+"quantity"
			shopObject.product_array.each do |i|
				puts "#{i.cat_name[:cat_name]}\t\t#{i.prod_id}\t\t#{i.prod_name}\t\t#{i.cost_price}\t\t#{i.tax}\t\t#{i.discount}\t\t#{i.saling_price}\t\t#{i.quantity}"
			end
			tempProduct = mainProduct.clone
			puts "Enter how much quantity you want "
			qty = gets.chomp.to_i
			tempProduct.quantity = qty
			leftProduct = mainProduct.quantity - tempProduct.quantity   
   	        mainProduct.quantity = leftProduct
   	        puts "Left item: #{mainProduct.quantity}\n"
			puts "Do u want to continue : Type c or n"
            c = gets.chomp
        	@wish_list << tempProduct
        	if c!= "c"
               more = false
            end
		end
    end

	def show_wish_list
		puts "category"+"\t"+"product_id"+"\t"+"product_name"+"\t"+"cost_price"+"\t"+"tax"+"\t"+"discount"+"\t"+"saling_price"+"\t"+"quantity"
			@wish_list.each do |i|
				puts "#{i.cat_name[:cat_name]}\t\t#{i.prod_id}\t\t#{i.prod_name}\t\t#{i.cost_price}\t\t#{i.tax}\t\t#{i.discount}\t\t#{i.saling_price}\t\t#{i.quantity}"
			end
	end

	def remove_product_from_wish_list
		more = true
		while more == true
			puts "Select product to remove"
			item = gets.chomp.to_i
			removeProduct = @wish_list.delete_at(item)
			puts "category"+"\t"+"product_id"+"\t"+"product_name"+"\t"+"cost_price"+"\t"+"tax"+"\t"+"discount"+"\t"+"saling_price"+"\t"+"quantity"
			@wish_list.each do |i|
				puts "#{i.cat_name[:cat_name]}\t\t#{i.prod_id}\t\t#{i.prod_name}\t\t#{i.cost_price}\t\t#{i.tax}\t\t#{i.discount}\t\t#{i.saling_price}\t\t#{i.quantity}"
			end
			puts "Do you want to remove more products : Type c or n"
			c = gets.chomp.to_i
			if c!= "c"
	            more = false
	        end
	    end
	end

	def check_out
		@total = 0
        puts "product_id"+"\t"+"product_name"+"\t"+"cost_price"+"\t"+"tax"+"\t"+"discount"+"\t"+"saling_price"+"\t"+"quantity"
        @wish_list.each do |i| 
        	puts "#{i.prod_id}\t\t#{i.prod_name}\t\t#{i.cost_price}\t\t#{i.tax}\t\t#{i.discount}\t\t#{i.saling_price}\t\t#{i.quantity}"
			@QintoP =  i.saling_price * i.quantity
            @total = @total + @QintoP
        end
        puts "-----------------------------------------------------------------------------------------------"
        puts "total : #{@total}"
	end
end


class UserInterface
	attr_accessor :shop, :cart

	def initialize
		@shop = Shop.new
		@cart = Cart.new
	end

	def main_menu
		action = true
		while action == true
			puts " 1. Add product to Main productList\n 2. Dispaly main productlist\n 3. Remove product from main list\n 4. Select product to add to your wish_list\n 5. Remove product from wish_list\n 6. Dispaly selected product\n 7. Make bill of purchased product\n 8. Exit"
            puts "\nEnter your choice:"
            x = gets.to_i
            case x

	            when 1
	            	@shop.add_product_to_main_list
	        	 when 2
	        	 	@shop.display_main_product_list
	        	 when 3
	        	 	@shop.remove_product_from_main_list
	        	 when 4
	        	 	@cart.add_product_to_wish_list(shop)
	        	 when 5
	        	 	@cart.remove_product_from_wish_list
	        	 when 6
	        	 	@cart.show_wish_list
	        	 when 7
	        	 	@cart.check_out
        		else
        			break
        	end
		end
	end
end

user = UserInterface.new
user.main_menu

# shop = Shop.new
# shop.addProduct