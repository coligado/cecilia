Rails.application.routes.draw do
  root 'homepage#index'
  
  get 'homepage/show_topics'

  get 'italianize' => 'homepage#italianize'
  get 'homepage/italianize'

  get 'about' => 'homepage#about', as: 'about'
end
