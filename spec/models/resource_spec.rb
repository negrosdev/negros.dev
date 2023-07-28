require 'rails_helper'

RSpec.describe Resource, type: :model do
  context 'presence' do
    it { should validate_presence_of(:name) }
  end

  context 'uniqueness' do
    before { create(:resource) }

    it { should validate_uniqueness_of(:name) }
  end

  context 'associations' do
    it { should belong_to(:content) }
  end
end
