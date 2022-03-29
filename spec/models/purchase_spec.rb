require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:purchase_items) }
    it { is_expected.to have_many(:materials) }
  end
end
