require 'rails_helper'

RSpec.describe Content, type: :model do
  context 'presence' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:slug) }

    context 'associations' do
      it { should belong_to(:category) }
      it { should have_many(:resources) }
    end

    context 'should have specific status' do
      it { should define_enum_for(:status) }
      it do
        should define_enum_for(:status).with_values %i[draft published review]
      end
    end

    it 'should have categories' do
      category = create(:category)
      content = create(:content, category:)

      expect(content.category).to eq(category)
    end

    it 'should have resources' do
      content = create(:content)
      resource = create(:resource, content:)

      expect(content.resources).to include(resource)
    end

    it 'should create slug' do
      category = create(:category)
      content = create(:content, name: 'Creating columns in SQL database', category:)

      expect(content.slug).to be_present
      expect(content.slug).to eq('creating-columns-in-sql-database')
    end
  end
end
