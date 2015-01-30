class Band < ActiveRecord::Base
  has_and_belongs_to_many :venues, -> {order('venue_name')}
  validates(:band_name, {:presence => true, :length => {:maximum => 50 }})
  validates_uniqueness_of(:band_name, {:case_sensitive => false})
  before_save(:capitalize_entire_name)
  Band.order('band_name')

  default_scope {order('band_name')}

  private
  
  define_method(:capitalize_entire_name) do
    split_string =[]
    self.name().split(' ').each do |word|
      split_string.push(word.capitalize())
    end
    self.name = split_string.join(' ')
  end

end
