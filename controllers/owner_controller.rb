require('sinatra')
require('sinatra/contrib/all')
require("sinatra/reloader") if development?
require('pry-byebug')
require("pry")
require_relative("../models/owner.rb")
require_relative("../models/animal.rb")
require_relative("../models/sql_runner.rb")


######## show all owners
get '/owners' do
  @owners = Owner.all
  erb(:"owners/index")
end
