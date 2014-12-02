Rails.application.routes.draw do
  resources :blog_contents, path: :blog, as: :blog, param: :slug, only: [:create, :edit, :destroy]

  resources :users
  scope ':name' do
    get '/', controller: :users, action: :show
    resources :blog_contents, path: :blog, as: :blog, param: :slug, only: [:index, :show]
  end
end
