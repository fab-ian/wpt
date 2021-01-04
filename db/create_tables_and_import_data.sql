CREATE TABLE stops (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  stop_name VARCHAR(50),
  latitude REAL,
  longitude REAL,
  post VARCHAR(2)
);

CREATE INDEX stops_name ON stops(stop_name); 

INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Sady Żoliborskie', 52.264000, 20.973129, '01');
