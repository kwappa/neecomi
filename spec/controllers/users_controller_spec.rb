require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) do
    User.create!(
      name: 'test_user',
      email: 'test_user@example.com',
      password: 'password'
    )
  end

  describe 'get #sign_out' do
    subject(:request) { get(:sign_out) }

    context 'when user is logging in' do
      before { sign_in user }
      it { expect(request).to be_ok }
    end

    context 'when user does not logging in' do
      it { expect(request).to redirect_to root_path }
    end
  end
end
