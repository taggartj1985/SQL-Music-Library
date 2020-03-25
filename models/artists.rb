require_relative("../db/sql_runner")

class Artists

  attr_accessor :band
  attr_read :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @band = options['band']
  end





end
