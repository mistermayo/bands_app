class Band < ActiveRecord::Base
  has_and_belongs_to_many :venues, -> {order('venue_name')}
  validates(:band_name, {:presence => true, :length => {:maximum => 50 }})
  validates_uniqueness_of(:band_name, {:case_sensitive => false})
  before_save(:titlecase_band_name)
  Band.order('band_name')


  default_scope {order('band_name')}

  private

  define_method(:titlecase_venue_name) do
    self.band_name=(band_name().titlecase())
  end

end
