require 'rails_helper'

RSpec.describe PurchasesController, type: :controller do
  describe 'GET #index' do
    context "when user is logged in" do
      let(:user) {create(:user) }
      before do
        sign_in user
        get :index
      end
      it {is_expected.to respond_with(:success)}
    end
    context "when user is not logged in" do
      before { get :index }
      it { is_expected.to respond_with(:redirect) }
    end
  end
end