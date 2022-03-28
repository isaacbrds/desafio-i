class MaterialsController < ApplicationController
  before_action :set_material, only: %i[show edit destroy update]

  def index
    @materials = Material.page(params[:page])
    title_field = params[:title]
    if title_field.present?
      @materials = Material.for_title(title_field).page(params[:page])
    end
  end

  def new
    @material = Material.new
  end

  def create
    @material = Material.new(material_params)
    if @material.save
      redirect_to materials_path, notice: 'material was successfully created'
    else
      render :new
    end
  end

  def show; end
  def edit; end

  def update
    if @material.update(material_params)
      redirect_to materials_path, notice: 'material was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    begin
      @material.destroy
      redirect_to materials_path, notice: 'material was successfully destroyed'
    rescue ActiveRecord::DeleteRestrictionError
      flash[:error] = 'material was not destroyed'
      redirect_to materials_path
    end
  end

  private

  def set_material
    @material = Material.find(params[:id])
  end

  def material_params
    params.require(:material).permit(:title, :quantity)
  end
end
