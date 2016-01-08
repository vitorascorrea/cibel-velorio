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

Então(/^eu deveria estar na página de edição da reserva de "(.*?)"$/) do |nome|
  expect(current_path).to eq(edit_reserva_path(Reserva.find_by(falecido: nome).id))
end