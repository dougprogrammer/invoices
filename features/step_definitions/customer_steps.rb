
Dado(/^que estou logado$/) do
    @login_page = LoginPage.new
    @dash_page = DashPage.new
    @customer_page = CustomerPage.new

    @login_page.load
    @login_page.do_login('kato.danzo@qaninja.io', 'secret')
    @dash_page.wait_for_title
	
    @customer_page.load
end
  
Quando(/^faço o cadastro do seguinte cliente:$/) do |table|
    @customer = table.rows_hash
    @customer_page.save(@customer)
   

    #combobox, dropdown
    # choose number randon inside array
    # @tipos = {'Gold', 'Prime', 'Platinum'}
    # sample == ruby
    # @customer_page.type.find('option', text: @tipos.sample).select_option


    #IFS
    # @ativo = true
    # if @ativo == true
	#     puts 'Ativado'
    # end
    # puts 'Ativado' if @ativo == true
    # puts 'Desativado' unless @ativo == true

    # if @customer['Sexo'] == "M"
    #     @customer_page.gender_m.click
    # elsif @customer['Sexo'] == "F"
    #     @customer_page.gender_f.click
    # end
    
    
    sleep 5
end

Quando(/^esse cliente já está cadastrado$/) do
    @customer_page.save(@customer)
end
  
Então(/^esse cadastro deve ser exibida na lista de clientes$/) do
    @customer_page.search(@customer['Email'])
    sleep 2
        
    puts @customer_page.table_body.text
    
    target = @customer_page.table_body.text

    expect(target).to have_content @customer['Nome']
    expect(target).to have_content @customer['Email']
    expect(target).to have_content @customer['Celular']
end

Então(/^esse cadastro não deve ser exibido na lista de clientes$/) do
    #dataview-table tbody tr if is equal one register 1 ==true elsif more 1 on menor that zero false
    @customer_page.search(@customer['Email'])
    expect(@customer_page.table_items.size).to eql 1
end