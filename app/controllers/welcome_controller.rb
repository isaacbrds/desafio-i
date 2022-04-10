class WelcomeController < ApplicationController
  def index
    purchases = Purchase.all
    orders = Order.all
  end
end
