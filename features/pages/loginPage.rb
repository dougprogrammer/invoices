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



