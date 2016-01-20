Rails.application.routes.draw do
  root 'sessions#new'
  
  get  'home'                 => 'home#home'
  get  'pesquisa'             => 'reservas#pesquisa'
  post 'pesquisa'             => 'reservas#pesquisa'
  get  'login'                => 'sessions#new'
  post 'login'                => 'sessions#create'
  post 'criar_funcionario'    => 'funcionarios#create'
  get 'adm'                   => 'funcionarios#adm'
  
  patch 'pre_edicao'          => 'reservas#pre_edicao'
  get  'main'                 => 'formularios#main'
  post 'filtro_salas'         => 'formularios#filtro_salas'
  post 'dados_reserva'        => 'formularios#dados_reserva'
  post 'criar_reserva'        => 'formularios#criar_reserva'
  post 'confirmar_reserva'    => 'formularios#confirmar_reserva'
  get  'impressao'            => 'formularios#impressao'
  
  post 'selecao_velorio'      => 'reservas#selecao_velorio'

  delete 'logout'             => 'sessions#destroy'
  
  resources 'salas'
  resources 'funcionarios'
  resources 'reservas'
  
end
