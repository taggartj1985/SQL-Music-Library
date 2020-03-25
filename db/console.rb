require("pry")
require_relative("../models/artists")
require_relative("../models/albums")

Albums.delete_all()

Artists.delete_all()

band1 = Artists.new({'band'=>'RHCP'})

band1.save()

band2 = Artists.new({'band'=>'Stone Sour'})

band2.save()

album1 = Albums.new({'title'=>'One Hot Minute',
'genre'=>'rock',
'band_id'=>band1.id
  })

  album1.save()

album2 = Albums.new({'title'=>'By The WAY',
'genre'=>'rock',
'band_id'=>band1.id
  })

  album2.save()

  album3 = Albums.new({'title'=>'Come What(ever) May',
  'genre'=>'hard rock',
  'band_id'=>band2.id
    })

    album3.save()


band1.show_albums()
album3.find_artists()

band2.band = "Metallica"
band2.artists_update()

album3.title = "Master Of Puppets"
album3.album_update()

Artists.all()
Albums.all()
Artists.find(1)
Albums.find(1)





binding.pry
nil
