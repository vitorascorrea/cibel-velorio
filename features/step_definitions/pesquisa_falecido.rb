Dado(/^que eu estou na página inicial$/) do
  visit root_url
end

Quando(/^eu preencher o campo "(.*?)" com "(.*?)"$/) do |campo, valor|
  fill_in campo, :with => valor
end

Quando(/^eu clicar em "(.*?)"$/) do |botao|
	debugger
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
