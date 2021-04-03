
require 'rails_helper'

RSpec.describe SourceCode, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    
    it { should validate_presence_of(:url) }
    it { should validate_uniqueness_of(:url) }
  end
end
