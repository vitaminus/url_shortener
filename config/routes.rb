UrlShortener::Application.routes.draw do
  root :to => 'links#new'

  resources :links
  match 'admin' => 'links#admin'
    
  match ':short_link' => 'links#show', :via => "get"
  
end
