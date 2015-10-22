Rails.application.routes.draw do
  root 'sessions#new'
  get  'selecao_velorio'     => 'formularios#selecao_velorio'
  get  'filtro_salas'        => 'formularios#filtro_salas'  
  get  'confirmacao_reserva' => 'formularios#confirmacao_reserva'
  get  'login'               => 'sessions#new'
  post 'login'               => 'sessions#create'
  resources 'salas'
  resources 'funcionarios'
  resources 'reservas'

end
