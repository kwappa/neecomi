Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users

  get 'user_root', controller: :users, action: :after_edit, method: :get

  namespace :users do
    get :sign_out
  end

  resources :blog_contents, path: :blog, as: :blog, param: :slug, only: [:create, :edit, :destroy]

  scope ':name' do
    get '/', controller: :users, action: :show
    resources :blog_contents, path: :blog, as: :blog, param: :slug, only: [:index, :show]
  end
end
