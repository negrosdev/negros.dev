require 'rails_helper'

RSpec.describe Content, type: :model do
  describe 'belongs_to' do
    it { is_expected.to belong_to :author }
    it { is_expected.to belong_to :tag }
    it { is_expected.to have_many :tracks }
  end

  describe 'presence_of' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :description }
  end

  describe '#course' do
    it 'validate uniqueness of' do
      FactoryBot.create(:content)

      is_expected.to validate_uniqueness_of(:title)
    end
  end
end
