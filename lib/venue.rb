class Venue < ActiveRecord::Base
  has_and_belongs_to_many :bands, -> {order('band_name')}
  validates(:venue_name, {:presence => true, :length => {:maximum => 50 }})
  validates_uniqueness_of(:venue_name, {:case_sensitive => false})
  before_save(:capitalize_every_word)

  private

  define_method(:capitalize_entire_name) do
    split_string =[]
    self.name().split(' ').each do |word|
      split_string.push(word.capitalize())
    end
    self.name = split_string.join(' ')
  end

end
