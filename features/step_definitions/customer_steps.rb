
Dado(/^que estou logado$/) do
    @login_page = LoginPage.new
    @dash_page = DashPage.new
    @customer_page = CustomerPage.new

    @login_page.load
    @login_page.do_login('kato.danzo@qaninja.io', 'secret')
    @dash_page.wait_for_title

    @customer_page.load
end
  
Quando(/^faço o cadastro desse cliente$/) do |table|
    @customer = table.rows_hash

    @customer
end
  
Então(/^esse cadastro deve ser exibida na lista de clientes$/) do
    pending # Write code here that turns the phrase above into concrete actions
end