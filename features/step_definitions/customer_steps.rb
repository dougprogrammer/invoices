#encoding: utf-8

Dado(/^que estou logado$/) do
    @login_page = LoginPage.new
    @dash_page = DashPage.new
    @customer_page = CustomerPage.new

    visit($environment)
	
    #@login_page.load
    @login_page.do_login('kato.danzo@qaninja.io', 'secret')
    @dash_page.wait_for_title
	
    binding.pry
    #@customer_page.load
end
  
Quando(/^faço o cadastro do seguinte cliente:$/) do |table|
    @data_customer = table.rows_hash
    @customer_page.save(@data_customer)
   

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
    @customer_page.save(@data_customer)
end
  
Então(/^esse cadastro deve ser exibida na lista de clientes$/) do
    @customer_page.search(@data_customer['Email'])
        
    puts @customer_page.table_body.text
    
    target = @customer_page.table_body.text

    expect(target).to have_content @data_customer['Nome']
    expect(target).to have_content @data_customer['Email']
    expect(target).to have_content @data_customer['Celular']
end

Então(/^devo ver a mensagem de alerta:$/) do |message|
    expect(@customer_page.sweet_alert.content.first.text 
    ).to eql message
    @customer_page.sweet_alert.ok.click
end

Então(/^deve exibir somente 1 cliente na lista$/) do |quantidy|
    @customer_page.search(@data_customer['Email'])
    expect(@customer_page.table_items.size).to eql 1
end

Então(/^esse cadastro não deve ser exibido na lista de clientes$/) do
    #dataview-table tbody tr if is equal one register 1 ==true elsif more 1 on menor that zero false
    @customer_page.search(@data_customer['Email'])
    expect(@customer_page.table_items.size).to eql 1
end

#delete
Quando(/^solicito a exclusão de 1 cliente$/) do |arg1|
    puts @customer = new_customer
    
    @customer_page.remove(@customer)
end


Quando(/^confirmo a solicitação de exclusão$/) do 
    @customer_page.modal.yes.click
end

Quando(/^esse cliente não deve ser exibido na lista$/) do 
    #he always insert client but after remove the same
    @customer_page.search(@data_customer['Email'])
    
    expect(@customer_page.search_alert.text
        ).to eql "\"#{@customer['Email']}\" não encontrado."
end
