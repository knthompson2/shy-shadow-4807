require 'rails_helper'

RSpec.describe 'plots index page' do
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
    PlantPlot.create!(plant: @plant7, plot: @plot3)
    PlantPlot.create!(plant: @plant4, plot: @plot4)
    PlantPlot.create!(plant: @plant5, plot: @plot4)
    PlantPlot.create!(plant: @plant6, plot: @plot4)
    PlantPlot.create!(plant: @plant7, plot: @plot4)
    PlantPlot.create!(plant: @plant3, plot: @plot4)

    visit "/plots"
  end

  it 'has a list of all plot numbers and the plants in that plot' do
    within("#plots-#{@plot1.id}") do
      expect(page).to have_content(@plot1.number)
      expect(page).to have_content(@plant1.name)
      expect(page).to have_content(@plant2.name)
      expect(page).to have_content(@plant5.name)
    end
  end

  it 'has a link next to each plant to delete that plant from that plot' do
    
    within("#plots-#{@plot1.id}") do
      expect(page).to have_content(@plot1.number)
      expect(page).to have_content(@plant1.name)
      expect(page).to have_content(@plant2.name)
      expect(page).to have_content(@plant5.name)
      within ("#plant-#{@plant1.id}") do
        click_on "Remove Plant"
        expect(current_path).to eq("/plots")
      end
      expect(page).to_not have_content(@plant1.name)
    end
    save_and_open_page
    within("#plots-#{@plot2.id}") do
      expect(page).to have_content(@plant1.name)
    end
  end
end
