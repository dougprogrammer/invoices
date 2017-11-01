#language: pt

Funcionalidade: Cadastro de clientes
	Sendo um assinante do invoices
	Posso cadastrar meus clientes
	Pata que possa manter atualizados os dados dos meus consumidores que compram meus serviços

	Contexto: Acesso
		Dado que estou logado
		
	@insert_client
	Cenário: Cadastro de novo cliente

		Quando faço o cadastro do seguinte cliente:
			| Nome    | Fernando Papito      |
			| Celular | 11 997879879877      |
			| Email   | fernando@qaninja.com |
			| Sexo    | M			         |
			| Tipo    | Gold				 |
			| Obs     | bla bla bla          |
			| Info    | testes				 |
		Então esse cadastro deve ser exibida na lista de clientes

	@cliente_duplicado
	Cenário: Cliente duplicado

		Quando faço o cadastro do seguinte cliente:
			| Nome    | Thais da Silva       |
			| Celular | 11 999999999         |
			| Email   | thais@teste.com.br   |
			| Sexo    | f			         |
			| Tipo    | Gold				 |
			| Obs     | bla bla bla          |
			| Info    | Sim         		 |
		Mas esse cliente já está cadastrado
		Então devo ver a mensagem de alerta:
		"""
		Já existe um cliente cadastrado com o email informado!
		"""
		E deve exibir somente 1 cliente na lista
		#Então esse cadastro não deve ser exibido na lista de clientes
			#E vejo a seguinte mensagem de alerta "Já existe um cliente para este email"

	@delete
	Cenário: Remover cliente

		Quando solicito a exclusão de 1 cliente
			E confirmo a solicitação de exclusão
		Então esse cliente não deve ser exibido na lista