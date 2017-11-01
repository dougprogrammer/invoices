#encoding: utf-8

Dado(/^que entrei na página login$/) do 
    @login_page = LoginPage.new
    @dash_page = DashPage.new

    @login_page.load
end 

Quando(/^faço login$/) do |table|
    @user = table.rows_hash
    @login_page.do_login(@user)
end
  
Então(/^vejo o dashboard com a mensagem "([^"]*)" usuários$/) do |hello|
   expect(@dash_page.title.text).to eql 'Dashboard'

   #user sections
   expect(@dash.nav.usermenu.text).to eql @user['Email']

   expect(@dash_page.hello_msg.text).to have_content "#{hello} #{@user['Nome']}" 
end

Então(/^devo ver a mensagem de alerta "([^"]*)"$/) do |alert_msg|
   expect(@login_page.alert_error.text).to eql alert_msg
end
