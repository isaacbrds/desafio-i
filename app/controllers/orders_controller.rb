class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
    @materials = Material.all
    @order = Order.new
    @order.order_items.build
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    if @order.save
      redirect_to materials_path, notice: 'order was successfully created'
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(order_items_attributes: [:id, :material_id, :quantity, :order_id, :_destroy])
  end
end
