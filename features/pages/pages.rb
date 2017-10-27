
class LoginPage < SitePrism::Page
	set_url '/login'
	element :email, '#email'
	element :password, 'input[type=password]'
	element :sign_in, 'button[id*=password]'
	element :alert_error, '#login=errors'

	def do_loading(u)
		self.email.set u['Email']		  
		self.password.set u['Senha']
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

