require 'rails_helper'

RSpec.describe Project, type: :model do
  describe Project do
    it { should validate_presence_of :name }
    it { should validate_length_of(:name).is_at_least(2) }
    it { should have_many(:users) }
    it { should belongs_to(:manager) }
  end
end
