require_relative("../db/sql_runner")
require_relative('./artists')

class Albums

  attr_accessor :title, :genre, :band_id
  attr_reader :id

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @band_id = options['band_id'].to_i
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO albums
    (title, genre, band_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @genre, @band_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

def Albums.delete_all()
  sql = "DELETE FROM albums"
  SqlRunner.run(sql,[])
end

def Albums.all()
  sql = "SELECT * FROM albums"
  cds = SqlRunner.run(sql,[])
  return cds.map {|album|Albums.new(album)}
end

def find_artists()
  sql = 'SELECT * FROM artists WHERE id = $1'
  values = [@band_id]
  band = SqlRunner.run(sql, values)[0]
  return Artists.new(band)
end

def album_update()
  sql = "UPDATE albums SET (title, genre, band_id) = ($1, $2, $3) WHERE id = $4"
  values = [@title, @genre, @band_id, @id]
  SqlRunner.run(sql, values)
end

def Albums.find(id)
  sql = "SELECT * FROM albums WHERE id = $1"
  value = [@id]
  album = SqlRunner.run(sql, value)
  return album.map{|albums|Albums.new(albums)}
end


end
