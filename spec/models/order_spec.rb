require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:order_items) }
    it { is_expected.to have_many(:materials) }
  end
end
