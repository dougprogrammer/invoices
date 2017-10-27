After('@logout') do
		
	find('#navbar #usermenu').click
	find('#navbar #menu-items a[href$=logout]').click

	@nav = NavBar.new

	expect(@nav.user_menu.text).to eql @user['Email']

	@nvc.user_menu.click
	@nav.logout.click
end
