class WelcomeController < ApplicationController
  def index
    @purchases = Purchase.page(params[:page])
    @orders = Order.page(params[:page])
  end
end
