Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users
  namespace :users do
    get :sign_out
  end


  resources :blog_contents, path: :blog, as: :blog, param: :slug, only: [:create, :edit, :destroy]

  scope ':name' do
    get '/', controller: :users, action: :show
    resources :blog_contents, path: :blog, as: :blog, param: :slug, only: [:index, :show]
  end
end
