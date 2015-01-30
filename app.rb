require('bundler/setup')
Bundler.require(:default, :test)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get("/") do
  @bands = Band.all()
  @venues = Venue.all()
  erb(:index)
end

get("/bands") do
  @bands = Band.all()
  erb(:bands)
end

get("/venues") do
  @venues = Venue.all()
  erb(:venues)
end

post("/bands") do
  band_name = params.fetch("band_name")
  band = Band.new({:band_name => band_name, :id => nil})
  band.save()
  @bands = Band.all()
  erb(:bands)
end

post("/venues") do
  venue_name = params.fetch("venue_name")
  venue = Venue.new({:venue_name => venue_name, :id => nil})
  venue.save()
  @venues = Venue.all()
  erb(:venues)
end

get("/bands/:id") do
  @band = Band.find(params.fetch("id").to_i())
  @venues = Venue.all()
  erb(:band_edit)
end

get("/venues/:id") do
  @venue = Venue.find(params.fetch("id").to_i())
  @bands = Band.all()
  erb(:venue_edit)
end

patch("/bands/:id") do
  band_id = params.fetch("id").to_i()
  @band = Band.find(band_id)
  venue_ids = params.fetch("venue_ids").to_i()
  @band.update({:venue_ids => venue_ids})
  @venues = Venue.all()
  erb(:band_edit)
end

patch("/venue/:id") do
  venue_id = params.fetch("id").to_i()
  @venue = Venue.find(venue_id)
  band_ids = params.fetch("band_ids").to_i()
  @venue.update({:band_ids => band_ids})
  @bands = Band.all()
  erb(:venue_edit)
end
