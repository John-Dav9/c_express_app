class SectorsController < ApplicationController
  before_action :set_sector, only: [:show, :edit, :update, :destroy]
  def show
  end

  def new
    @sector = Sector.new
  end

  def create
    @sector = Sector.new(params[sector_params])
    if @sector.save
      redirect_to sector_path(@sector), notice: "Secteur ajoutée avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end
 
  def edit
  end

  def update
    if @sector.update(sector_params)
    redirect_to sector_path(@sector), notice: "Secteur mise à jour avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
     @sector.destroy
     redirect_to sectors_path, status: :see_other
  end

  private

  def sector_params
    params.require(:sector).permit(:name, :description)
  end

  def set_sector
    @sector = Sector.find(params[:id])
  end
end
