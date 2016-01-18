# language: pt

Funcionalidade: Formulario de exclusão e edição
	Para saber quem e por que uma reserva foi alterada
	Como um agenciador
	Eu quero que, quando eu clicar em editar ou excluir, apareça um formulario de justificativa

	@javascript
	Cenario: Justificativa e exclusao
		Dado que existe um agenciador
		E que existe uma reserva cujo falecido é "Maria" no velorio "Velorio de Maria" com sepultamento "1969-12-31 21:00:00"
		Dado que eu estou na página inicial
		Quando eu preencher o campo "session_rf" com "01"
		E eu preencher o campo "session_password" com "01"
		E eu clicar em "Acessar"
		Então eu deveria estar na página do agenciador
		Quando eu clicar em "Listar Reservas"
		Então eu deveria estar na página de listagem
		Quando eu selecionar o valor "Velorio de Maria" no campo "velorio_id"
		E eu clicar em "Enviar"
		Então a página deveria ter o css "excluir_reserva_Maria"
		Quando eu clicar no modal "excluir_reserva_Maria"
		Então eu deveria ver "Justifique a exclusão"
		Quando eu preencher o campo "reserva_justificativa" com "Teste"
		E eu clicar em "Deletar"
		Então eu deveria estar na página de listagem
		Quando eu selecionar o valor "Velorio de Maria" no campo "velorio_id"
		E eu clicar em "Enviar"
		Então a página não deveria ter o css "excluir_reserva_Maria"

	@javascript
	Cenario: Justificativa e edicao
		Dado que existe um agenciador
		E que existe uma reserva cujo falecido é "Maria" no velorio "Velorio de Maria" com sepultamento "2016-01-20 21:00:00"
		Dado que eu estou na página inicial
		Quando eu preencher o campo "session_rf" com "01"
		E eu preencher o campo "session_password" com "01"
		E eu clicar em "Acessar"
		Então eu deveria estar na página do agenciador
		Quando eu clicar em "Listar Reservas"
		Então eu deveria estar na página de listagem
		Quando eu selecionar o valor "Velorio de Maria" no campo "velorio_id"
		E eu clicar em "Enviar"
		Então a página deveria ter o css "editar_reserva_Maria"
		Quando eu clicar no modal "editar_reserva_Maria"
		Então eu deveria ver "Justifique a edição"
		Quando eu preencher o campo "reserva_justificativa" com "Teste"
		E eu clicar em "Editar"
		Então eu deveria estar na página de edição da reserva de "Maria"