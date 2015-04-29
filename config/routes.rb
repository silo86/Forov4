Rails.application.routes.draw do
  

  devise_for :users
  resources :topics do
#     resources :favorites

  
    resources :comments do
#     resources :flags
    end
  end

  put "/topics/:id/favorites" => "favorites#update", as: :favorite
 put "/topics/:id/comments/:comments_id/flag" => "flags#update", as: :flags
get 'adminpanels/index'
  root to: 'welcome#index'


end
