Rails.application.routes.draw do

root to: 'quincus_dataxchanges#index'

post 'api/geocodes/geocode_file', to: 'api/geocodes#geocode_file'
get 'api/geocodes/geocode_file/:batch_id', to: 'api/geocodes#get_flatshipment'
post 'api/geocodes/algo_job_control_tower', to: 'api/geocodes#algo_job_control_tower'

get 'get_users', to: 'quincus_dataxchanges#get_users'
post 'authenticate', to: 'user_authentication#authenticate'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
