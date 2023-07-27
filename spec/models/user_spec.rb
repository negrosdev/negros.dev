require 'rails_helper'

RSpec.describe User, type: :model do
  context 'presence' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:roles) }

    context 'should be student' do
      let(:user) { create(:user) }

      it { expect(user.student?).to be_truthy }
    end

    context 'should be admin' do
      let(:user) { create(:user, roles: :admin) }

      it { expect(user.admin?).to be_truthy }
    end
  end
end
