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
        let(:attr) { user_attributes.merge(name: '') }
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

      context 'when duplicated' do
        before { User.create!(user_attributes) }

        context 'when case sencitive' do
          let(:attr) { user_attributes }
          it { expect(user).to_not be_valid }
        end

        context 'when case inssencitive' do
          let(:attr) do
            user_attributes.merge(
              name: user_attributes[:name].upcase,
              email: 'other_dummy_user@example.com',
            )
          end
          it { expect(user).to be_valid }
        end
      end

      context 'when too short' do
        let(:attr) { user_attributes.merge(name: 's' ) }
        it { expect(user).to_not be_valid }
      end

      context 'when too long' do
        let(:attr) { user_attributes.merge(name: 's' * 241 ) }
        it { expect(user).to_not be_valid }
      end

      context 'when reserved' do
        let(:attr) { user_attributes.merge(name: 'index') }
        it { expect(user).to_not be_valid }
      end
    end

    describe 'email' do
      context 'when blank' do
        let(:attr) { user_attributes.merge(email: nil) }
        it { expect(user).to_not be_valid }
      end

      context 'when duplicated' do
        before { User.create!(user_attributes) }

        context 'when case sencitive' do
          let(:attr) { user_attributes }
          it { expect(user).to_not be_valid }
        end

        context 'when case inssencitive' do
          let(:attr) { user_attributes.merge(email: user_attributes[:email].upcase) }
          it { expect(user).to_not be_valid }
        end
      end

      context 'when invalid format' do
        let(:attr) { user_attributes.merge(email: 'INVALID_EMAIL_FORMAT') }
        it { expect(user).to_not be_valid }
      end
    end
  end
end
