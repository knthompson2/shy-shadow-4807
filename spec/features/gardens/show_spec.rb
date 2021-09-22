require 'rails_helper'

RSpec.describe 'garden show page' do
  before :each do
    @garden = Garden.create!(name: "Turing Community Garden", organic: true)
    @plot1 = @garden.plots.create!(number: 1, size: "Small", direction: "North")
    @plot2 = @garden.plots.create!(number: 2, size: "Medium", direction: "South")
    @plot3 = @garden.plots.create!(number: 3, size: "Small", direction: "East")
    @plot4 = @garden.plots.create!(number: 4, size: "Large", direction: "West")
    @plant1 = Plant.create(name: "Sunflower", description: "Big, yellow, pretty", days_to_harvest: 45)
    @plant2 = Plant.create(name: "Carrot", description: "Root vegetable, orange, rabbits love", days_to_harvest: 85)
    @plant3 = Plant.create(name: "Potato", description: "Root vegetable, brown, yummy mashed", days_to_harvest: 100)
    @plant4 = Plant.create(name: "Grape Tomato", description: "Delicious bites of tomato-y goodness", days_to_harvest: 47)
    @plant5 = Plant.create(name: "Purple Beauty Sweet Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
    @plant6 = Plant.create(name: "Watermelon", description: "Juicy deliciousness", days_to_harvest: 101)
    @plant7 = Plant.create(name: "Pumpkin", description: "Grows on vine; fun to carve", days_to_harvest: 120)
    PlantPlot.create!(plant: @plant1, plot: @plot1)
    PlantPlot.create!(plant: @plant2, plot: @plot1)
    PlantPlot.create!(plant: @plant5, plot: @plot1)
    PlantPlot.create!(plant: @plant1, plot: @plot2)
    PlantPlot.create!(plant: @plant3, plot: @plot2)
    PlantPlot.create!(plant: @plant4, plot: @plot2)
    PlantPlot.create!(plant: @plant5, plot: @plot2)
    PlantPlot.create!(plant: @plant1, plot: @plot3)
    PlantPlot.create!(plant: @plant6, plot: @plot3)
    PlantPlot.create!(plant: @plant4, plot: @plot4)
    PlantPlot.create!(plant: @plant5, plot: @plot4)
    PlantPlot.create!(plant: @plant6, plot: @plot4)
    PlantPlot.create!(plant: @plant3, plot: @plot4)
  end

  it 'lists all plants for the garden with days to harvest less that 100' do
    visit "/gardens/#{@garden.id}"

    expect(page).to have_content(@plant2.name)
    expect(page).to have_content(@plant4.name)
    expect(page).to have_content(@plant5.name)
    expect(page).to have_content(@plant1.name)
  end


end
