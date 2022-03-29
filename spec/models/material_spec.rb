require 'rails_helper'

RSpec.describe Material, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_uniqueness_of(:title) }
  it { is_expected.to validate_numericality_of(:quantity).is_greater_than_or_equal_to(0) }
  
  describe "associations" do
    it { is_expected.to have_many(:purchase_items) }
    it { is_expected.to have_many(:purchases) }
    it { is_expected.to have_many(:order_items) }
    it { is_expected.to have_many(:orders) }
  end
end
