Rails.application.routes.draw do
  root 'google_datas#index'
  resources :google_datas, only: [:index, :show]
end
