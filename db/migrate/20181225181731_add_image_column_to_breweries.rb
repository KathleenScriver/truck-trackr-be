class AddImageColumnToBreweries < ActiveRecord::Migration[5.2]
  def change
    add_column :breweries, :logo_image, :string
  end
end
