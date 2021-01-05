CREATE TABLE IF NOT EXISTS stops (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  stop_name VARCHAR(50) NOT NULL,
  latitude REAL NOT NULL,
  longitude REAL NOT NULL,
  post VARCHAR(2) NOT NULL
);

CREATE INDEX IF NOT EXISTS stops_name ON stops(stop_name); 
