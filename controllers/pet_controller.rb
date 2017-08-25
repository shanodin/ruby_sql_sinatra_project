require('sinatra')
require('sinatra/contrib/all')
require("sinatra/reloader") if development?
require('pry-byebug')
require("pry")
require_relative("../models/owner.rb")
require_relative("../models/pet.rb")
require_relative("../models/sql_runner.rb")


######## show all pets
get '/pets' do
  @pets = Pet.all
  erb(:"pets/index")
end
