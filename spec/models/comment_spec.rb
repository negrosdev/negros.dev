require 'rails_helper'

RSpec.describe Comment, type: :model do
  
  describe 'associations validate' do
    it { is_expected.to belong_to :content }  
  end
  
  describe 'presence validate' do
    it { is_expected.to validate_presence_of(:discord_id) }
    it { is_expected.to validate_presence_of(:body) }
  end
end
