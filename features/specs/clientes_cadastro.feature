#language: pt

Funcionalidade: Cadastro de clientes
	Sendo um assinante do invoices
	Posso cadastrar meus clientes
	Pata que possa manter atualizados os dados dos meus consumidores que compram meus serviços

	Contexto: Acesso
		Dado que estou logado
		
	Cenário: Cadastro de novo cliente

		Quando faço o cadastro desse cliente
			| Nome    | Fernando Papito      |
			| Celular | 11 997879879877      |
			| Email   | fernando@qaninja.com |
			| Sexo    | M			         |
			| Tipo    | Gold				 |
			| Obs     | bla bla bla          |
		Então esse cadastro deve ser exibida na lista de clientes
