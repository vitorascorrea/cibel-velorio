Feature: Login Correto
  Como um agenciador
  Eu quero efetuar o login no sistema Cibel
  Para poder efetuar reservas de velório

  Scenario: Agenciador consegue se logar
    Given Eu estou na pagina de login 
    And Eu preencho o 'rf' com '01'
    And Eu preencho o 'password' com '01'
    And Eu clico em 'Acessar'
    Then Eu estou na pagina de checagem de login 
    And o Login é valido
    Then Devo ser redirecionado para a pagina principal do agenciador