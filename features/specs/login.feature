#language: pt


Funcionalidade: Login
	Para poder gerenciar o meu negócio
	Sendo um assinante
	Posso acessar o sisteam Invoices


	Contexto: Acesso
		Dado que entrei na página login
			
	@logout
	Cenário: Admnistrador faz login
	
		Quando faço login
			| Nome  | Kato Danzo 			|
			| Email | kato.danzo@qaninja.io |
			| Senha | secret  				|
		Então vejo o dashboard com a mensagem "Olá," usuários

	@tentativa
	Esquema do Cenário: Tentativa de login
		
			
		Quando faço login
			| Email | <email> |
			| Senha | <senha> |
		Então vejo o dashboard com a mensagem <msg_alerta> usuários

		Exemplos:
		| email 		  		  | senha     | msg_alerta 	    	      |
		| kato.danzo@qaninja.io   | test#123  | "Senha inválida"          |
		| kato.danzo@qa.ninja.net | 123456    | "Usuário não cadastrado"  |
		| kato.danzo@qaninja.net  | 123456    | "Informe um emáil válido" |
	


