Rails.application.routes.draw do
  root 'homepage#index'

  get 'about' => 'homepage#about', as: 'about'
  get 'create' => 'homepage#create'
  get 'error' => 'homepage#error'
  get 'show' => 'italianize#show'
end
