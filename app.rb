require('bundler/setup')
Bundler.require(:default, :test)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @bands = Band.all()
  @band = Band.new()
  erb(:index)
end

post('/bands') do
  band_name = params.fetch('band_name')
  @band = Band.new({:band_name => band_name})
  @band.save()
  erb(:success)
end

get('/bands/:id/edit') do
  @band = Band.find(params.fetch("id").to_i())
  erb(:band_edit)
end

patch("/bands/:id") do
  band_name = params.fetch("band_name")
  @band = Band.find(params.fetch("id").to_i())
  @band.update({:band_name => band_name})
  @bands = Band.all()
  erb(:index)
end
