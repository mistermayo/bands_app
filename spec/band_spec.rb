require('spec_helper')

describe(Band) do
  it{ should have_and_belong_to_many(:venues) }
  it{ should validate_presence_of(:band_name) }
  it{ should ensure_length_of(:band_name).is_at_most(50) }
  it{ should validate_uniqueness_of(:band_name) }

  describe(:titlecase_band_name) do
    it("will titlecase the band names") do
      band1 = Band.create({:band_name => "rocker dudes"})
      expect(band1.band_name()).to(eq("Rocker Dudes"))
    end
  end
end
