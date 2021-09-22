class PlantPlotsController < ApplicationController
  def destroy
    plant_plot = PlantPlot.find_by(plant: params[:plant_id], plot: params[:plot_id])
    plant_plot.destroy
    redirect_to "/plots"
  end
end
