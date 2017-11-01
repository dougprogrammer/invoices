#Sections


module Sections
	class NavBar < SitePrism::Section
		element :user_menu, '#navbar #usermenu'
		element :logout, '#navbar #menu-items a[href$=logout]'

		def do_logout
			self.user_menu.click
			self.logout.click
		end
	end
	class SweetAlert < SitePrism::Section
		elements :content, 'p'
		element :ok, 'button[class=con firm]'
	end
	class ModalDialog < SitePrism::Section
		element :yes, 'button[data--bb-handler="sucess"]'
		element :nos, 'button[data--bb--handler="danger"]'	
	end
	
end



