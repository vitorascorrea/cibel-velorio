# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ nome: 'Chicago' }, { nome: 'Copenhagen' }])
#   Mayor.create(nome: 'Emanuel', city: cities.first)

ag = Agencia.create(nome: 'Agencia Teste')
func = Funcionario.create(rf: '0000000', nome: 'Testador', password: '123456')
at = Atendente.create(funcionario_id: func.id, agencia_id: ag.id, adm: true)

Cemiterio.create(nome: 'Araçá')
Cemiterio.create(nome: 'Campo Grande')
Cemiterio.create(nome: 'Dom Bosco')
Cemiterio.create(nome: 'Freguesia do Ó')
Cemiterio.create(nome: 'Itaquera')
Cemiterio.create(nome: 'Lajeado')
Cemiterio.create(nome: 'Lapa')
Cemiterio.create(nome: 'Quarta Parada')
Cemiterio.create(nome: 'Santana')
Cemiterio.create(nome: 'Santo Amaro')
Cemiterio.create(nome: 'São Luiz')
Cemiterio.create(nome: 'São Paulo')
Cemiterio.create(nome: 'São Pedro')
Cemiterio.create(nome: 'Saudade')
Cemiterio.create(nome: 'Tremembé')
Cemiterio.create(nome: 'Vila Formosa II')
Cemiterio.create(nome: 'Vila Mariana')
Cemiterio.create(nome: 'Vila Nova Cachoeirinha')

Velorio.create(nome: 'Araçá')
Velorio.create(nome: 'Campo Grande')
Velorio.create(nome: 'Dom Bosco')
Velorio.create(nome: 'Freguesia do Ó')
Velorio.create(nome: 'Itaquera')
Velorio.create(nome: 'Lajeado')
Velorio.create(nome: 'Lapa')
Velorio.create(nome: 'Quarta Parada')
Velorio.create(nome: 'Santana')
Velorio.create(nome: 'Santo Amaro')
Velorio.create(nome: 'São Luiz')
Velorio.create(nome: 'São Paulo')
Velorio.create(nome: 'São Pedro')
Velorio.create(nome: 'Saudade')
Velorio.create(nome: 'Tremembé')
Velorio.create(nome: 'Vila Formosa II')
Velorio.create(nome: 'Vila Mariana')
Velorio.create(nome: 'Vila Nova Cachoeirinha')

Sala.create(velorio: Velorio.find(1), especial: false)
Sala.create(velorio: Velorio.find(1), especial: false)
Sala.create(velorio: Velorio.find(1), especial: false)