Rails.application.routes.draw do
  root 'google_datas#index'
  resources :google_datas, only: [:index, :show]
  match "/spreadsheet" => 'google_datas#spreadsheet', via: [:post, :get]
end
