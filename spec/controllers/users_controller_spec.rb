require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'get #show' do
    subject(:request) { get(:show, id: 1) }
    context 'when user does not found' do
      it { expect(request).to be_not_found }
    end
  end
end
