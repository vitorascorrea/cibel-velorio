Rails.application.routes.draw do
<<<<<<< HEAD
  
  root      'sessions#new'
  
  get       'selecao_velorio'          => 'formularios#selecao_velorio'
  get       'filtro_salas'             => 'formularios#filtro_salas'
  get       'confirmacao_reserva'      => 'formularios#confirmacao_reserva'
  
  get       'login'                    => 'sessions#new'
  post      'login'                    => 'sessions#create'
  
  delete    'logout'                   => 'sessions#destroy'
  
  resources :salas
  resources :funcionarios
  resources :reservas
=======
  root 'sessions#new'
  get  'main'                 => 'formularios#main'
  post  'filtro_salas'        => 'formularios#filtro_salas'  
  post  'confirmacao_reserva' => 'formularios#confirmacao_reserva'
  get  'login'                => 'sessions#new'
  post 'login'                => 'sessions#create'
  delete 'logout'             => 'sessions#destroy'
  resources 'salas'
  resources 'funcionarios'
  resources 'reservas'

>>>>>>> Primeira_Sprint
end
