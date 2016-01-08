Dado(/^que eu estou na página inicial$/) do
  visit '/'
end

Quando(/^eu preencher o campo "(.*?)" com "(.*?)"$/) do |campo, valor|
  fill_in campo, :with => valor
end

Quando(/^eu clicar em "(.*?)"$/) do |botao|
  click_on(botao, visible: false)
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

Dado(/^que existe um agenciador$/) do
	func = FactoryGirl.create(:funcionario, rf: "01", password: "01")
  FactoryGirl.create(:atendente, funcionario: func)
end

Dado(/^que existe uma reserva cujo falecido é "(.*?)" no velorio "(.*?)" com sepultamento "(.*?)"$/) do |nome, velorio, horario|
  vel = FactoryGirl.create(:velorio, nome: velorio)
  FactoryGirl.create(:reserva, falecido: nome, velorio: vel, sepultamento: horario.to_time)
end
