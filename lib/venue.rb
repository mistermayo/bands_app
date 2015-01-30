class Venue < ActiveRecord::Base
  has_and_belongs_to_many :bands, -> {order('band_name')}
  validates(:venue_name, {:presence => true, :length => {:maximum => 50 }})
  validates_uniqueness_of(:venue_name, {:case_sensitive => false})
  before_save(:titlecase_venue_name)
  Venue.order('venue_name')


  default_scope {order('venue_name')}

  private

  define_method(:titlecase_venue_name) do
    self.venue_name=(venue_name().titlecase())
  end

end
