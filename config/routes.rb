Rails.application.routes.draw do
  # get 'video_log/index'

  get 'welcome/index'

  resources :players do
  	resources :comments
  end

  resources :videos

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
