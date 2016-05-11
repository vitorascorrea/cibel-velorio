# language: pt

Funcionalidade: Realizar a reserva de velorio
  Para reservar um velório em um dos velórios municipais
  Como um agenciador
  Eu quero reservar um velório com sucesso

  @javascript
  Cenario: Reserva com sucesso
    Dado que existe um velório "Araçá" com uma sala
    Dado que existe um cemitério "Araçá"
    Dado que existe um agenciador
    Dado que eu estou na página inicial
    Quando eu preencher o campo "session_rf" com "01"
    E eu preencher o campo "session_password" com "01"
    E eu clicar em "Acessar"
    Então eu deveria estar na página do agenciador
    E eu deveria ver "Nova Reserva"
    Quando eu clicar em "Nova Reserva"
    Então eu deveria estar na página de reserva de velório
    Quando eu selecionar o valor "Araçá" no campo "cemiterio_id"
    E eu selecionar o valor "Sim" no campo "mesmo_local"
    E eu clicar em "Próximo Passo"
    Então eu deveria ver "Selecione a sala e horário de sepultamento"
    Quando eu clicar em um horário
    E eu clicar em "Próximo passo"
    Então eu deveria ver "Preencha os dados"
    Quando eu preencher o campo "form_d_obito" com "000000"
    E eu preencher o campo "form_ncf" com "000000"
    E eu preencher o campo "form_n_falecido" com "Maria"
    E eu preencher o campo "form_n_municipe" com "Mario"
    E eu clicar em "Próximo Passo"
    Então eu deveria ver "Confirme os dados"
    Quando eu clicar em "Confirmar reserva"
    Então eu deveria estar na página do agenciador
