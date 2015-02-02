require('spec_helper')

describe(Venue) do
  it{ should have_and_belong_to_many(:bands) }
  it{ should validate_presence_of(:venue_name) }
  it{ should ensure_length_of(:venue_name).is_at_most(50) }
  it{ should validate_uniqueness_of(:venue_name) }

  describe(:titlecase_venue_name) do
    it("will titlecase the venue names") do
      venue1 = Venue.create({:venue_name => "the roxy"})
      expect(venue1.venue_name()).to(eq("The Roxy"))
    end
  end
end
