class DosesController < ApplicationController
# before_action :set_dose, only: [:show, :destroy]

  # def new
  #   @dose = Dose.new
  #   @cocktail = Cocktail.find(params[:cocktail_id])
  # end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
      if @dose.save
        redirect_to cocktail_path(@cocktail)
      else
        render :new
      end
  end

  def destroy
    # @cocktail = @dose.cocktail
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  # def set_dose
  #   @dose = Dose.find(params[:id])
  # end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
