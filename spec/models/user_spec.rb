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
    subject(:user) { described_class.new(attr) }

    describe 'name' do
      context 'when blank' do
        let(:attr) { user_attributes.merge(name: nil) }
        it { expect(user).to_not be_valid }
      end

      context 'with valid character' do
        let(:attr) { user_attributes.merge(name: 'name-NAME_123') }
        it { expect(user).to be_valid }
      end

      context 'with invalid character' do
        context 'when blank' do
          let(:attr) { user_attributes.merge(name: 'with blank') }
          it { expect(user).to_not be_valid }
        end
        context 'when non-ASCII' do
          let(:attr) { user_attributes.merge(name: '煮込み太郎') }
          it { expect(user).to_not be_valid }
        end
      end
    end
  end
end
