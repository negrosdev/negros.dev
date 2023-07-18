require 'rails_helper'

RSpec.describe Content, type: :model do
  context 'presence' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:slug) }

    it 'should create slug' do
      content = create(:content, name: 'Creating columns in SQL database')

      expect(content.slug).to be_present
      expect(content.slug).to eq('creating-columns-in-sql-database')
    end
  end
end
