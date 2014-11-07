require 'rails_helper'

RSpec.describe '/:user', type: :routing do
  context 'resources :blog_contents' do
    subject(:blog_entry) { { get: '/routing_user/blog/target_blog_id' } }
    it 'routes to /:user/blog/:id' do
      expect(blog_entry).to route_to(
                              controller: 'blog_contents',
                              action: 'show',
                              user: 'routing_user',
                              slug: 'target_blog_id',
                            )
    end
  end
end
