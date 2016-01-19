Dado(/^que existe um administrador$/) do
	func = FactoryGirl.create(:funcionario, rf: "01", password: "01")
  FactoryGirl.create(:atendente, funcionario: func, adm: true)
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
  expect(current_path).to eq(new_session_path)
end
