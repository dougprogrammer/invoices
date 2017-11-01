
module Helpers
	# def remove_customer[email]
	# 	client = Mongo::Client.new[$mongo_url]
	# 	client[:customer].delete_many(email: email)
	# 	client.close
	# 	sleep 5
	# end
	def new_costumer
		@name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
		@customer = {
			'Nome' => @name,
			'Telefone' => '1199999999',
			'Email' => Faker::Internet.free_email(@name),
			'Tipo' => ['Gold','Prime','Platinum'].sample
		}
		@customer_page.save(@customer)
		@customer
	end
	
end
