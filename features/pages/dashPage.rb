
class DashPage < SitePrism::Page

	section :nav, Sections::NavBar, 'div[id=navbar]'

	element :title, '#content h3[id=page_title]'
	element :hello_msg, '#content #title_row p'
	
end

