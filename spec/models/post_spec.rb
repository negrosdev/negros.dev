require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'belongs_to' do
    it { is_expected.to belong_to :author }
  end

  describe 'presence_of' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :content }
  end

  describe 'uniqueness_ of' do
    before { FactoryBot.create(:post) }
    it { is_expected.to validate_uniqueness_of(:title) }
  end
end
