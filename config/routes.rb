Rails.application.routes.draw do
  resources :users
  scope ':user' do
    resources :blog_contents, path: :blog, as: :blog
  end
end
