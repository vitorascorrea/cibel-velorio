Given(/^Eu estou na pagina de login$/) do
  visit root_path
end

And(/^Eu preencho o 'rf' com '01'$/) do
	fill_in "session[rf]", :with => "01"
end

And(/^Eu preencho o 'password' com '01'$/) do
	fill_in "session[password]", :with => "01"
end

And(/^Eu clico em 'Acessar'$/) do
	click_on "acessar"
end

Then(/^Eu estou na pagina de checagem de login$/) do
  current_path.should == login_path
end

And(/^o Login é valido$/) do
	Funcionario.find_by_rf('01')
end

Then(/^Devo ser redirecionado para a pagina principal do agenciador$/) do
  current_path.should == "/login"
end