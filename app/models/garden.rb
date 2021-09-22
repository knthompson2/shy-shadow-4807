class Garden < ApplicationRecord
  has_many :plots

  def all_plants_under_100
    plots.joins(:plants)
        .select("plants.*")
        .where("plants.days_to_harvest < ?", 100)
        .group("plants.id")
        .distinct
        .order(:name)
        .pluck("plants.name")
  end
end
