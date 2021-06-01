require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end

  describe '' do
    let!(:author) { FactoryBot.create(:author) }
    it 'valid linkedin profile' do
      expect(author.linkedin_url).to include(author.linkedin)
    end
  end
end
