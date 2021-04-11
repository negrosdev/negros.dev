require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'associations' do
    it { should belong_to(:author)}
    it { should belong_to(:category)}
    it { should belong_to(:album).optional }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:slug) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:level) }
  end
end
