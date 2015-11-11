Rails.application.routes.draw do
  root 'sessions#new'
  
  get  'main'                 => 'formularios#main'
  get  'login'                => 'sessions#new'
  
  post 'login'                => 'sessions#create'
  post 'filtro_salas'         => 'formularios#filtro_salas'
  post 'dados_reserva'        => 'formularios#dados_reserva'
  post 'criar_reserva'        => 'formularios#criar_reserva'
  post 'confirmar_reserva'    => 'formularios#confirmar_reserva'

  delete 'logout'             => 'sessions#destroy'
  
  resources 'salas'
  resources 'funcionarios'
  resources 'reservas'
  
end
