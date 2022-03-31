class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.page(params[:page])
  end

  def new
    @materials = Material.all
    @purchase = Purchase.new
    @purchase.purchase_items.build
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.user = current_user
    if @purchase.save
      redirect_to purchases_path, notice: 'Purchase was successfully created'
    else
      render :new
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(purchase_items_attributes: [:id, :material_id, :quantity, :purchase_id, :_destroy])
  end
end
