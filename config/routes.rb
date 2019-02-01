Rails.application.routes.draw do

root to: 'quincus_dataxchanges#index'
get 'get_users', to: 'quincus_dataxchanges#get_users'
post 'authenticate', to: 'user_authentication#authenticate'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
