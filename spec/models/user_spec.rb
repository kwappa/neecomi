require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user_attributes) do
    {
      name: 'dummy_user',
      email: 'dummy_user@example.com',
      password_digest: 'x' * 32,
    }
  end

  let(:user) { described_class.new(user_attributes) }

  describe 'validations' do
    describe 'name' do
      context 'when blank' do
        let(:attr) { user_attributes.merge(name: nil) }
        subject(:user) { described_class.new(attr) }
        it { expect(user).to_not be_valid }
      end
    end
  end
end
