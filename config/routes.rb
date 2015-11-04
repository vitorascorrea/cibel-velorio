Rails.application.routes.draw do
  root 'sessions#new'
  
  get  'main'                 => 'formularios#main'
  get  'login'                => 'sessions#new'
  
  post 'login'                => 'sessions#create'
  
  delete 'logout'             => 'sessions#destroy'
  
  resources 'salas'
  resources 'funcionarios'
  resources 'reservas'
  
end
