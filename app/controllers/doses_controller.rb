class DosesController < ApplicationController
  before_action :set_dose, only: [:new, :create]

  def new
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    @dose = @cocktail.doses.create(params_dose)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end
#
  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktails_path
  end

  private

  def set_dose
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def params_dose
    params.require(:dose).permit(:description, :ingredient_id)
  end
end