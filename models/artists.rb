require_relative("../db/sql_runner")

class Artists

  attr_accessor :band
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @band = options['band']
  end

  def save()
    sql = "INSERT INTO artists
    (band) VALUES ($1) RETURNING *"
    values = [@band]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def Artists.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql,[])
  end

  def Artists.all()
    sql = "SELECT * FROM artists"
    bands = SqlRunner.run(sql,[])
    return bands.map {|bands|Artists.new(bands)}
  end

  def show_albums()
    sql = "SELECT * FROM albums WHERE band_id = $1"
    values =[@id]
    albums = SqlRunner.run(sql, values)
    return albums.map {|album| Albums.new(album)}
  end

  def artists_update()
    sql = "UPDATE artists SET band = $1 WHERE id = $2"
    values = [@band, @id]
    SqlRunner.run(sql, values)
  end

  def Artists.find(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    value = [@id]
    band = SqlRunner.run(sql, value)
    return band.map{|bands|Artists.new(bands)}
  end

end
