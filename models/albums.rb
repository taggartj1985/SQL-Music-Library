require_relative("../db/sql_runner")
require_relative('./artists')

class Albums

  attr_accessor :title, :genre, :band_id
  attr_read :id

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @band_id = options['band_id'].to_i
  end




end
