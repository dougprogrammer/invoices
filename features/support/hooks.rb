Before('@login') do
	@login = LoginPage.new
	@login.load
	@dash.nav.do_logout
end

After('@logout') do
	dash.nav.logout
end

After do |scenario| 
	@file_name = scenario.name.gsub('','_')

	@file_name = @file_name.gsub(',''').gsub('(','').delete(')').delete('#')

	@target = "reports/screenshots/#{@file_name.downscase!}.png"

	page.save_screenshot(@target)
	embed(@target, 'image/png', 'Clique aqui para ver a evidência')
end
