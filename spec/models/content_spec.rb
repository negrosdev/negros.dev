require 'rails_helper'

RSpec.describe Content, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :author }
    it { is_expected.to belong_to :tag }
  end

  describe 'presence_of' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :content }
    it { is_expected.to validate_presence_of :slug }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :level }

    it { is_expected.to validate_presence_of :content_download_url }
  end
  describe '#course' do
    it 'validate uniqueness of' do
      FactoryBot.create(:content)

      is_expected.to validate_uniqueness_of(:title)
      is_expected.to validate_uniqueness_of(:slug)
      is_expected.to validate_uniqueness_of(:content_download_url)
    end
  end
end
