require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'associations' do
    it { should belong_to(:author).class_name('Author') }
    it { should belong_to(:category).class_name('Category') }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:slug) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:level) }
    it { should validate_presence_of(:code) }
  end
end
