class CreateVenuesBands < ActiveRecord::Migration
  def change
    create_table(:venues_bands) do |t|
      t.integer(:venue_id)
      t.integer(:band_id)

    end
  end
end
