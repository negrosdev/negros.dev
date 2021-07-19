require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end

  describe 'validate social network' do
    let!(:author) { FactoryBot.create(:author) }
    it 'validate email url' do
      expect(author.mail_url).to include(author.email)
    end
    it 'validate linkedin url' do
      expect(author.linkedin_url).to include(author.linkedin)
    end
    it 'validate instagram url' do
      expect(author.instagram_url).to include(author.instagram)
    end
    it 'validate facebook url' do
      expect(author.facebook_url).to include(author.facebook)
    end

    it 'validate github url' do
      expect(author.github_url).to include(author.github)
    end

    it 'validate twitter url' do
      expect(author.twitter_url).to include(author.twitter)
    end
  end
end
