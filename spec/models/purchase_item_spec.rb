require 'rails_helper'

RSpec.describe PurchaseItem, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:material) }
    it { is_expected.to belong_to(:purchase) }
  end
end
