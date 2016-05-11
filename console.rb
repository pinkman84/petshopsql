require_relative( './models/pets' )
require_relative( './models/store' )

require( 'pry-byebug' )



store1 = Store.new( {'name' => 'BitchnDog supplies', 'address' => 'Liberty City', 'type' => 'Dog Supplies'}).save()


pet1 = Pet.new( {'name' => 'Fluffy', 'type' => 'dog', 'image' => 'http://www.funnypica.com/wp-content/uploads/2015/05/Funny-Dog-faces-2.jpg', 'store_id' => store1.id} )
pet2 = Pet.new( {'name' => 'Mittens', 'type' => 'Bastard AKA Cat', 'image' => 'http://i.imgur.com/YPSjOCA.jpg', 'store_id' => store1.id} )
pet3 = Pet.new( {'name' => 'Sonar', 'type' => 'dog', 'image' => 'https://s-media-cache-ak0.pinimg.com/236x/85/b9/cf/85b9cf82ee71158858f26e4ea98a268f.jpg', 'store_id' => store1.id})


binding.pry
nil

