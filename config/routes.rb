Rails.application.routes.draw do
  
  root      'sessions#new'
  
  get       'selecao_velorio'          => 'formularios#selecao_velorio'
  post      'selecao_velorio_form'     => 'formularios#selecao_velorio_form'
  
  get       'filtro_salas'             => 'formularios#filtro_salas'
  post      'filtro_salas_form'        => 'formularios#filtro_salas_form'
  
  post      'confirmacao_reserva_form' => 'formularios#confirmacao_reserva_form'
  post      'confirmacao_reserva'      => 'formularios#confirmacao_reserva'
  
  get       'login'                    => 'sessions#new'
  post      'login'                    => 'sessions#create'
  
  delete    'logout'                   => 'sessions#destroy'
  
  resources :salas
  resources :funcionarios
  resources :reservas
end
