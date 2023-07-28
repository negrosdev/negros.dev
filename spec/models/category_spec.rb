require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'presence' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:color) }
  end

  context 'associations' do
    it { should have_many(:contents) }
  end

  context 'should have contents' do
    let(:category) { create(:category) }
    let!(:contents) { create_list(:content, 5, category:) }

    it { expect(category.contents.count).to eq(5) }
  end
end
