ag_svo = Agencia.create(nome: 'SVO')
func_at_svo = Funcionario.create(rf: '010', nome: 'Atendente - SVO', password: '010')
at_svo = Atendente.create(id: func_at_svo.id, funcionario: func_at_svo, agencia: ag_svo, adm: false)

ag_santo_amaro = Agencia.create(nome: 'Santo Amaro')
func_at_santo_amaro = Funcionario.create(rf: '011', nome: 'Atendente - Santo Amaro', password: '011')
at_santo_amaro = Atendente.create(id: func_at_santo_amaro.id, funcionario: func_at_santo_amaro, agencia: ag_santo_amaro, adm: false)

# CEMITÉRIO QUE NÃO TEM VELÓRIO:
Cemiterio.create(nome: 'Consolação')
Cemiterio.create(nome: 'Penha')
Cemiterio.create(nome: 'Parelheiros')
