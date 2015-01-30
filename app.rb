require('bundler/setup')
Bundler.require(:default, :test)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @bands = Band.all()
  erb(:index)
end

post('/bands') do
  band_name = params.fetch('band_name')
  @band = Band.create({:band_name => band_name})
  @bands = Band.all
  erb(:index)
end

get('/bands/:id/edit') do
  @band = Band.find(params.fetch("id").to_i())
  erb(:band_edit)
end

get("/bands/:id") do
  @band = Band.find(params["id"].to_i())
  erb(:band)
end

patch("/bands/:id") do
  band_name = params.fetch("band_name")
  @band = Band.find(params.fetch("id").to_i())
  @band.update({:band_name => band_name})
  erb(:band)
end

post("/venues") do
  venue_name = params.fetch("venue_name")
  band_id = params.fetch("band_id").to_i()
  venue = Venue.create({:venue_name => venue_name, :band_id => band_id})
  @band = Band.find(band_id)
  erb(:band)
end

patch("/venues/:id") do
  venue_name = params.fetch("venue_name")
  @venue = Venue.find(params.fetch("id").to_i())
  @venue.update({:venue_name => venue_name})
  @band = Band.find(params.fetch("id").to_i())
  erb(:band)
end

get("/venues/:id/edit") do
  @venue = Venue.find(params.fetch("id").to_i())
  erb(:venue_edit)
end

patch("/venues/:id") do
  venue_name = params["venue_name"]
  @venue = Venue.find(params.fetch("id").to_i())
  @venue.update({:venue_name => venue_name})
  @band = Band.find(params.fetch("id").to_i())
  erb(:band)
end
