require 'rails_helper'

RSpec.describe '/:name', type: :routing do
  context 'get "/"' do
    subject(:user_page) { { get: '/routing_user' } }
    it 'routes to users#show' do
      expect(user_page).to route_to(
                              controller: 'users',
                              action: 'show',
                              name: 'routing_user',
                            )
    end
  end

  context 'resources :blog_contents' do
    subject(:blog_entry) { { get: '/routing_user/blog/target_blog_id' } }
    it 'routes to /:name/blog/:id' do
      expect(blog_entry).to route_to(
                              controller: 'blog_contents',
                              action: 'show',
                              name: 'routing_user',
                              slug: 'target_blog_id',
                            )
    end
  end
end
