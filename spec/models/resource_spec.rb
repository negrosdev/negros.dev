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

  context 'should have resources' do
    let(:resource) { create(:resource, name: 'source code') }

    before do
      resource.file.attach(io: File.open('spec/support/files/source_code.rb'), filename: 'source_code.rb')
    end

    it { expect(resource.file.content_type).to    eq('text/x-ruby') }
    it { expect(resource.file.filename.to_s).to   eq('source_code.rb') }
    it { expect(resource.file.attached?).to       be_truthy }
  end
end
