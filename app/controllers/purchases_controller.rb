class PurchasesController < ApplicationController
  before_action :set_materials, only: %i[create new]
  def index
    @purchases = Purchase.page(params[:page])
  end

  def new
    
    @purchase = Purchase.new
    @purchase.purchase_items.build

    respond_to do |format|
      format.html 
      format.js
    end
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
  def set_materials
    @materials = Material.all
  end
end
