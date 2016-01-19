# language: pt

Funcionalidade: Controle de Administrador
	Para administrar os usuários e os velórios do sistema
	Como um agenciador administrador
	Eu quero poder cadastrar e editar usuários e velórios

	@javascript
	Cenario: Login Administrador
		Dado que existe um administrador		
		Dado que eu estou na página inicial
		Quando eu preencher o campo "session_rf" com "01"
		E eu preencher o campo "session_password" com "01"
		E eu clicar em "Acessar"
		Então eu deveria estar na página do agenciador
		E eu deveria ver "Administrar"
		Quando eu clicar em "Administrar"

	@javascript
	Cenario: Login não Administrador
		Dado que existe um agenciador
		Dado que eu estou na página inicial
		Quando eu preencher o campo "session_rf" com "01"
		E eu preencher o campo "session_password" com "01"
		E eu clicar em "Acessar"
		Então eu deveria estar na página do agenciador
		E eu não deveria ver "Administrar"

	@javascript
	Cenario: Criar conta agenciador
		Dado que existe um administrador		
		Dado que eu estou na página inicial
		Quando eu preencher o campo "session_rf" com "01"
		E eu preencher o campo "session_password" com "01"
		E eu clicar em "Acessar"
		Então eu deveria estar na página do agenciador
		Quando eu clicar em "Administrar"
		Então eu deveria estar na página do administrador
		Quando eu clicar em "Cadastrar Atendente"
		Então eu deveria estar na página de cadastro do atendente
		Quando eu preencher o campo "funcionario_nome" com "José"
		E eu preencher o campo "funcionario_rf" com "001"
		E eu preencher o campo "funcionario_password" com "001"
		E eu selecionar o valor "Agencia7" no campo "atendente_agencia_id"
		E eu clicar em "Cadastrar"
		Então eu deveria estar na página do administrador
		Quando eu clicar em "Sair"
		Então eu deveria estar na página inicial
		Quando eu preencher o campo "session_rf" com "001"
		E eu preencher o campo "session_password" com "001"
		E eu clicar em "Acessar"
		Então eu deveria estar na página do agenciador