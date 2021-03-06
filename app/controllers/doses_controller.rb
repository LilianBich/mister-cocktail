class DosesController < ApplicationController
  def new

    @params = params[:cocktail_id]
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktails_path
    else
      render :new
    end

  end

  def destroy
  end

  private
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
