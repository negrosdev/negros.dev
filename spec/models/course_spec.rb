require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :author }
    it { is_expected.to belong_to :category }
  end

  describe 'presence_of' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :content_download }
    it { is_expected.to validate_presence_of :vimeo_ref }
    it { is_expected.to validate_presence_of :slug }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :level }
  end
  describe '#course' do
    it 'validate uniqueness of' do
      FactoryBot.create(:course)

      is_expected.to validate_uniqueness_of(:title)
      is_expected.to validate_uniqueness_of(:slug)
      is_expected.to validate_uniqueness_of(:content_download)
    end
  end
end
