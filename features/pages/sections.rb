#Sections


module Sections
	class NabBar < SitePrism::Section
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
	
end



