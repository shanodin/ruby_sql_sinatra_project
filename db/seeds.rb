require_relative( '../models/owner.rb' )
require_relative( '../models/pet.rb' )
require('pry-byebug')

owner1 = Owner.new({
  'name' => 'Matthew Addison',
  'phone_number' => '01234 567890'
  })
owner1.save()

owner2 = Owner.new({
  'name' => 'Alice Rees',
  'phone_number' => '01987 654321'
  })
owner2.save()

owner3 = Owner.new({
  'name' => 'Seamus Macleod',
  'phone_number' => '04820 475262'
  })
owner3.save()

owner4 = Owner.new({
  'name' => 'Jonny Lockhart',
  'phone_number' => '03966 484659'
  })
owner4.save()

pet1 = Pet.new({
  'name' => 'Zeus',
  'type' => :cat,
  'breed' => 'moggie',
  'can_adopt' => true,
  'status' => 'Ready for Adoption',
  'admission_date' => '25/08/2017'
  })
pet1.save

pet2 = Pet.new({
  'name' => 'Bob',
  'type' => :dog,
  'breed' => 'Labrador x Pointer',
  'can_adopt' => false,
  'status' => 'Adopted',
  'admission_date' => '25/08/2017',
  'owner_id' => owner1.id
  })
pet2.save

pet3 = Pet.new({
  'name' => 'Puppy',
  'type' => :lizard,
  'breed' => 'Bearded Dragon',
  'can_adopt' => false,
  'status' => 'At the Vet',
  'admission_date' => '25/08/2017'
  })
  pet3.save
