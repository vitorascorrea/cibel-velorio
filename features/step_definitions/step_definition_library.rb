Então(/^eu deveria estar na página de listagem$/) do
  expect(current_path).to eq(reservas_path)
end

Quando(/^eu selecionar o valor "(.*?)" no campo "(.*?)"$/) do |valor, campo|
  select valor, :from => campo
end

Então(/^a página deveria ter o css "(.*?)"$/) do |css|
  string = '#' + css
  find(string)
end

Quando(/^eu clicar no modal "(.*?)"$/) do |modal|
  string = '#' + modal
  find(string).click
end

Então(/^a página não deveria ter o css "(.*?)"$/) do |css|
  expect(current_path).to_not have_content(css)
end

Então(/^eu espero "(.*?)"$/) do |sec|
  sleep sec.to_i
end

Então(/^eu deveria estar na página de edição da reserva de "(.*?)"$/) do |nome|
  expect(current_path).to eq(edit_reserva_path(Reserva.find_by(falecido: nome).id))
end

Então(/^eu deveria estar na página de reserva de velório$/) do
  expect(current_path).to eq('/main')
end

Quando(/^eu clicar em um horário$/) do
  page.find(:xpath, '//tr[(((count(preceding-sibling::*) + 1) = 3) and parent::*)]//*[contains(concat( " ", @class, " " ), concat( " ", "td_livre", " " )) and (((count(preceding-sibling::*) + 1) = 2) and parent::*)]//*[contains(concat( " ", @class, " " ), concat( " ", "agenda_livre", " " ))]').click
  page.execute_script "window.scrollBy(0,-1000)"
end

Dado(/^que existe um administrador$/) do
	func = FactoryGirl.create(:funcionario, rf: "01", password: "01")
  FactoryGirl.create(:atendente, funcionario: func, adm: true)
end

Dado(/^que existe uma agência "(.*?)"$/) do |valor|
	FactoryGirl.create(:agencia, nome: valor)
end

Então(/^eu não deveria ver "(.*?)"$/) do |valor|
  expect(page).to_not have_content(valor)
end

Então(/^eu deveria estar na página do administrador$/) do
  expect(current_path).to eq(adm_path)
end

Então(/^eu deveria estar na página de cadastro do atendente$/) do
  expect(current_path).to eq(new_funcionario_path)
end

Então(/^eu deveria estar na página inicial$/) do
  expect(current_path).to eq(root_url)
end

Dado(/^que eu estou na página inicial$/) do
  visit '/'
end

Quando(/^eu preencher o campo "(.*?)" com "(.*?)"$/) do |campo, valor|
  fill_in campo, :with => valor
end

Quando(/^eu clicar em "(.*?)"$/) do |botao|
  click_on(botao)
end

Então(/^eu deveria estar na página do agenciador$/) do
  expect(current_path).to eq(home_path)
end

Então(/^eu deveria estar na página de pesquisa$/) do
  expect(current_path).to eq(pesquisa_path)
end

Então(/^eu deveria ver "(.*?)"$/) do |conteudo|
	expect(page).to have_content(conteudo)
end

Dado(/^que eu estou na página de pesquisa$/) do
  visit pesquisa_path
end

Dado(/^que existe um velório "(.*?)" com uma sala$/) do |velorio|
  vel = FactoryGirl.create(:velorio, nome: velorio)
  FactoryGirl.create(:sala, velorio: vel)
end

Dado(/^que existe um cemitério "(.*?)"$/) do |cemiterio|
  FactoryGirl.create(:cemiterio, nome: cemiterio)
end

Dado(/^que existe um agenciador$/) do
	func = FactoryGirl.create(:funcionario, rf: "01", password: "01")
  FactoryGirl.create(:atendente, funcionario: func)
end

Dado(/^que existe uma reserva cujo falecido é "(.*?)" no velorio "(.*?)" com sepultamento "(.*?)"$/) do |nome, velorio, horario|
  vel = FactoryGirl.create(:velorio, nome: velorio)
  FactoryGirl.create(:reserva, falecido: nome, velorio: vel, sepultamento: horario.to_time)
end
