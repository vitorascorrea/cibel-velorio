Dado(/^que existe um administrador$/) do
	func = FactoryGirl.create(:funcionario, rf: "01", password: "01")
  FactoryGirl.create(:atendente, funcionario: func, adm: true)
end

Então(/^eu não deveria ver "(.*?)"$/) do |valor|
  expect(page).to_not have_content(valor)
end