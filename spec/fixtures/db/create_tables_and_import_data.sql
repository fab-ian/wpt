CREATE TABLE IF NOT EXISTS stops (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  stop_name VARCHAR(50) NOT NULL,
  latitude REAL NOT NULL,
  longitude REAL NOT NULL,
  post VARCHAR(2) NOT NULL
);

CREATE INDEX IF NOT EXISTS stops_name ON stops(stop_name); 

CREATE TABLE IF NOT EXISTS my_stops (
  id INTEGER  PRIMARY KEY AUTOINCREMENT,
  stop_id INTEGER,
  FOREIGN KEY(stop_id) REFERENCES stops(id)
);

CREATE TABLE IF NOT EXISTS distances (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  line VARCHAR(4) NOT NULL,
  latitude REAL NOT NULL,
  longitude REAL NOT NULL,
  vehicle_number VARCHAR(10) NOT NULL,
  brigade VARCHAR(4) NOT NULL,
  distance REAL NOT NULL,
  created INTEGER NOT NULL
);

BEGIN TRANSACTION;
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Kijowska', 52.248455, 21.044827, '01');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Kijowska', 52.249078, 21.044443, '02');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Kijowska', 52.248998, 21.043983, '03');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Kijowska', 52.248928, 21.044169, '03');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Kijowska', 52.249905, 21.041726, '04');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Kijowska', 52.249968, 21.041587, '04');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Kijowska', 52.249969, 21.041588, '04');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Kijowska', 52.250319, 21.043861, '05');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Kijowska', 52.250008, 21.043710, '06');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Kijowska', 52.250078, 21.043848, '06');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Kijowska', 52.250228, 21.043690, '07');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Kijowska', 52.249944, 21.044087, '08');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Kijowska', 52.249944, 21.044087, '88');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Ząbkowska', 52.251325, 21.038457, '01');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Ząbkowska', 52.251790, 21.038592, '02');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Ząbkowska', 52.251616, 21.038379, '03');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Ząbkowska', 52.251880, 21.038002, '04');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Ząbkowska', 52.253108, 21.036732, '06');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Dw.Wileński', 52.253739, 21.035454, '01');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Dw.Wileński', 52.255298, 21.034611, '02');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Dw.Wileński', 52.254118, 21.033248, '03');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Dw.Wileński', 52.255099, 21.036174, '04');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Dw.Wileński', 52.254287, 21.033324, '05');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Dw.Wileński', 52.256048, 21.038309, '06');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Dw.Wileński', 52.253857, 21.035613, '07');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Dw.Wileński', 52.255370, 21.034193, '08');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Dw.Wileński', 52.255999, 21.035241, '09');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Dw.Wileński', 52.255856, 21.035227, '10');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Dw.Wileński', 52.256139, 21.035580, '11');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Dw.Wileński', 52.255985, 21.035521, '12');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Dw.Wileński', 52.256291, 21.035926, '13');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Dw.Wileński', 52.256246, 21.036138, '14');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Ratuszowa-ZOO', 52.256614, 21.028536, '01');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Ratuszowa-ZOO', 52.257011, 21.028103, '02');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Ratuszowa-ZOO', 52.255951, 21.027758, '04');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Ratuszowa-ZOO', 52.255816, 21.029591, '05');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Ratuszowa-ZOO', 52.255522, 21.029812, '06');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Ratuszowa-ZOO', 52.255870, 21.029455, '71');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('pl.Hallera', 52.258094, 21.027097, '01');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('pl.Hallera', 52.260034, 21.024845, '02');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('pl.Hallera', 52.259193, 21.025233, '03');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('pl.Hallera', 52.258983, 21.025560, '04');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('pl.Hallera', 52.259699, 21.025992, '05');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('pl.Hallera', 52.259900, 21.028465, '06');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('pl.Hallera', 52.261451, 21.029709, '07');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('pl.Hallera', 52.260974, 21.030804, '08');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('pl.Hallera', 52.259662, 21.027361, '09');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('pl.Hallera', 52.259771, 21.027364, '10');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('pl.Hallera', 52.259600, 21.027130, '11');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('pl.Hallera', 52.259870, 21.026924, '12');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('pl.Hallera', 52.259927, 21.027177, '18');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('rondo Starzyńskiego', 52.263615, 21.019547, '01');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('rondo Starzyńskiego', 52.263264, 21.020062, '02');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('rondo Starzyńskiego', 52.263453, 21.019762, '03');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('rondo Starzyńskiego', 52.263465, 21.020062, '04');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('rondo Starzyńskiego', 52.263049, 21.021071, '05');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('rondo Starzyńskiego', 52.263146, 21.021061, '06');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('rondo Starzyńskiego', 52.264116, 21.022528, '07');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('rondo Starzyńskiego', 52.264224, 21.022909, '08');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('rondo Starzyńskiego', 52.262572, 21.021846, '09');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('rondo Starzyńskiego', 52.262745, 21.022003, '10');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('rondo Starzyńskiego', 52.264087, 21.023168, '12');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Golędzinów', 52.266656, 21.020014, '01');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Golędzinów', 52.266819, 21.020003, '02');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Golędzinów', 52.266739, 21.020309, '03');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('Golędzinów', 52.266724, 21.020689, '04');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('PIMot', 52.269904, 21.017729, '01');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('PIMot', 52.270821, 21.017146, '02');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('PIMot', 52.270517, 21.016711, '03');
INSERT INTO stops (stop_name, latitude, longitude, post) VALUES('PIMot', 52.270007, 21.017369, '04');
COMMIT;
