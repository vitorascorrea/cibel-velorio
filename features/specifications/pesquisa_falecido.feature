# language: pt

Funcionalidade: Pesquisa de Falecido
	Para achar o local de velório do falecido
	Como um agenciador
	Eu quero pesquisar, usando o nome do falecido, o local de velório

	Cenario: Logar e pesquisar
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
		E eu deveria ver "Horario da Maria"
		E eu deveria ver "Local de Velorio da Maria"