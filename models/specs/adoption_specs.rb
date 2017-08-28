require_relative( '../adoption.rb' )
require('pry-byebug')
require("pry")
require('minitest/autorun')

class AdoptionTest < MiniTest::Test

  def setup

    @owner1 = Owner.new({
      'name' => 'Matthew Addison',
      'phone_number' => '01234 567890'
      })
    @owner1.save()

    @pet1 = Pet.new({
      'name' => 'Reilly',
      'type' => :dog,
      'breed' => 'Spaniel',
      'can_adopt' => false,
      'status' => 'Adopted',
      'admission_date' => '25/08/2017'
      })
    @pet1.save

    @adoption1 = Adoption.new({
      'owner_id' => @owner1.id,
      'pet_id' => @pet1.id
      })
    @adoption1.save()

  end

  def test_pet_name
    pet = @adoption1.pet
    name = pet.name
    assert_equal('Reilly', name)
  end

  def test_owner
    owner = @adoption1.owner
    name = owner.name
    assert_equal('Matthew Addison', name)
  end


end
