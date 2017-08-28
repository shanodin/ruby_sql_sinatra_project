require("sinatra")
require("sinatra/contrib/all")
require("pry")
require_relative("../models/owner.rb")
require_relative("../models/pet.rb")
require_relative("../models/adoption.rb")
require_relative("../models/sql_runner.rb")

###### show all adoptions
get "/adoptions" do
  @adoptions = Adoption.all
  erb(:"adoptions/index")
end

###### show individual adoption
# get "/adoptions/:id" do
#   @owner = Owner.find(params[:id])
#   @pet = Pet.find(params[:id])
#   erb(:"adoptions/show")
# end

###### new adoption form :)
get "/adoptions/new" do
  @pets = Pet.all
  @owners = Owner.all
  erb(:"adoptions/new")
end
#### add the adoption to the DB
post "/adoptions" do
  adoption = Adoption.new(params)
  adoption.save
  redirect to("/adoptions")
end

#### delete an adoption :(
post "/adoptions/:id/delete" do
  @adoption = Adoption.find(params[:id])
  @adoption.delete
  redirect to("/adoptions")
end

##### update adoption form
post '/adoptions/:id/edit' do
  @adoption = Adoption.find(params[:id])
  erb(:"adoptions/update")
end
##### submit update form to DB
post '/adoptions/:id' do
  @adoption = Adoption.new(params)
  @adoption.update
  redirect to "/adoption/#{@adoption.id}"
end
