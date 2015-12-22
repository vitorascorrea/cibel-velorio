# language: pt

Funcionalidade: Pesquisa de Falecido
	Para achar o local de velório do falecido
	Como um agenciador
	Eu quero pesquisar, usando o nome do falecido, o local de velório

	@javascript
	Cenario: Pesquisa
		Dado que existe um agenciador
		E que existe uma reserva cujo falecido é "Maria" no velorio "Velorio de Maria" com sepultamento "1969-12-31 21:00:00"
		Dado que eu estou na página inicial
		Quando eu preencher o campo "session_rf" com "01"
		E eu preencher o campo "session_password" com "01"
		E eu clicar em "Acessar"
		Então eu deveria estar na página do agenciador
		Quando eu clicar em "Pesquisar"
		Então eu deveria estar na página de pesquisa
		Quando eu preencher o campo "Nome" com "Maria"
		E eu clicar em "Buscar"
		Então eu deveria ver "Maria"
		E eu deveria ver "Velorio de Maria"
		E eu deveria ver "1969-12-31 21:00:00"

	@javascript
	Cenario: Pesquisa com mais de um resultado
		Dado que existe um agenciador
		E que existe uma reserva cujo falecido é "Maria" no velorio "Velorio de Maria" com sepultamento "1969-12-31 21:00:00"
		E que existe uma reserva cujo falecido é "Mariana" no velorio "Velorio de Mariana" com sepultamento "1969-12-31 21:00:00"
		E que existe uma reserva cujo falecido é "Mario" no velorio "Velorio de Mario" com sepultamento "1969-12-31 21:00:00"
		Dado que eu estou na página inicial
		Quando eu preencher o campo "session_rf" com "01"
		E eu preencher o campo "session_password" com "01"
		E eu clicar em "Acessar"
		Então eu deveria estar na página do agenciador
		Quando eu clicar em "Pesquisar"
		Então eu deveria estar na página de pesquisa
		Quando eu preencher o campo "Nome" com "ari"
		E eu clicar em "Buscar"
		Então eu deveria ver "Maria"
		E eu deveria ver "Velorio de Maria"
		E eu deveria ver "1969-12-31 21:00:00"
		E eu deveria ver "Mariana"
		E eu deveria ver "Velorio de Mariana"
		E eu deveria ver "1969-12-31 21:00:00"
		E eu deveria ver "Mario"
		E eu deveria ver "Velorio de Mario"
		E eu deveria ver "1969-12-31 21:00:00"

	@javascript
	Cenario: Pesquisa falhando
		Dado que existe um agenciador
		Dado que eu estou na página inicial
		Quando eu preencher o campo "session_rf" com "01"
		E eu preencher o campo "session_password" com "01"
		E eu clicar em "Acessar"
		Então eu deveria estar na página do agenciador
		Quando eu clicar em "Pesquisar"
		Então eu deveria estar na página de pesquisa
		Quando eu preencher o campo "Nome" com "arkhji"
		E eu clicar em "Buscar"
		Então eu deveria ver "Não encontrado"