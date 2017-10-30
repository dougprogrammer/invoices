
class LoginPage < SitePrism::Page
	set_url '/login'
	element :email, '#email'
	element :password, 'input[type=password]'
	element :sign_in, 'button[id*=btnLogin]'
	element :alert_error, '#login=errors'

	def do_login(user_login,password_login)
		self.email.set user_login		  
		self.password.set password_login
		self.sign_in.click
	end
	
end

class DashPage < SitePrism::Page
	element :title, '#content h3[id=page_title]'
	element :hello_msg, '#content #title_row p'
	
end

class NabBar < SitePrism::Page
	element :user_menu, '#navbar #usermenu'
	element :logout, '#navbar #menu-items a[href$=logout]'

	def do_logout
		self.user_menu.click
		self.logout.click
	end

end

class CustomerPage < SitePrism::Page
	set_url '/customers'

	element :new_customer, 'button[id*=insert]'
	element :name, 'input[name=name]'
	element :phone,'input[name=phone]'
	element :email, 'input[name=email]'
	element :gender_m, 'input[name=radio-m]'
	element :gender_f, 'input[name=radio-f]'
	element :type, 'select[id=type-customer]'
	element :note, 'textarea[name=note]'
	element :info, 'input[type=checkbox]'
	element :submit, 'button[id*=submit]'

	element :search_field, 'input[name=search]'
	element :search_submit, 'button[id*=search]'

	element :table_body, '#dataview-table tbody'
	#ele vai trazer uma coleção de tr
	elements :table_items, "#dataview-table tbody tr"

	def save(customer)
		self.new_customer.click
		self.name.set customer['Nome']
		self.phone.set customer['Celular']
		self.email.set customer['Email']
		self.gender_m.click if customer['Sexo'] == 'M'
		self.gender_f.click if customer['Sexo'] == 'F'
		self.type.find('option', text: customer['Tipo']).select_option
		#choose option randon
		#self.type.all('option').sample.select_option
		#self.gender_f.click
		self.note.set customer['Obs']
		#My test this one our zero	
		self.info.click if customer['info'] == 'Sim'
		self.submit.click
		sleep 5
	end

	def search(email)
		self.search_field.set email
		self.search_submit.click
	end	

end

