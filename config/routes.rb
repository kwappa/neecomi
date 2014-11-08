Rails.application.routes.draw do
  resources :users
  scope ':name' do
    get '/', controller: :users, action: :show
    resources :blog_contents, path: :blog, as: :blog, param: :slug
  end
end
