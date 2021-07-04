require 'rails_helper'

RSpec.describe Track, type: :model do
  describe 'belongs_to' do
    it { is_expected.to belong_to :content }
  end

  describe 'presence_of' do
    it { is_expected.to validate_presence_of :track_type }
    it { is_expected.to validate_presence_of :duration }
    it { is_expected.to validate_presence_of :order }
  end
end
