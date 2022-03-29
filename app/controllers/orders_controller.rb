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
    begin 
      @order.save
      redirect_to materials_path, notice: 'Order was successfully created'
    rescue Exception => e
      flash[:error] = e.message
      redirect_to orders_path
    end
  end

  private

  def order_params
    params.require(:order).permit(order_items_attributes: [:id, :material_id, :quantity, :order_id, :_destroy])
  end

  def check_quantity
    @material = Material.find(params[:order][:order_items_attributes]["0"][:material_id])
    quantity = (params[:order][:order_items_attributes]["0"][:quantity]).to_s
    render :new, flash[:error]= "Quantity is not enough " if @material.quantity.to_s < quantity
  end
end
