require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end

  describe 'valid social network' do
    let!(:author) { FactoryBot.create(:author) }
    it 'valid linkedin url' do
      expect(author.linkedin_url).to include(author.linkedin)
    end
  end
end
