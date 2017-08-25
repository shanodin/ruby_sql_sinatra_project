require_relative( '../models/owner.rb' )
require_relative( '../models/animal.rb' )
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
