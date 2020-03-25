DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;


CREATE TABLE artists ({
  id SERIAL PRIMARY KEY,
  band VARCHAR(255)
  });

CREATE TABLE albums ({
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255),
  band_id INT REFERENCES artists(id)
  });
