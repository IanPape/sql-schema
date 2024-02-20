DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE travelers (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE seats (
  id SERIAL PRIMARY KEY,
  seat_number TEXT NOT NULL,
  flight_id INTEGER REFERENCES flights(id)
);

CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline TEXT NOT NULL
);

CREATE TABLE TravelersFlights (
  traveler_id INTEGER REFERENCES travelers(id),
  flight_id INTEGER REFERENCES flights(id),
  PRIMARY KEY (traveler_id, flight_id)
);

CREATE TABLE TravelersSeats (
  traveler_id INTEGER REFERENCES travelers(id),
  seat_id INTEGER REFERENCES seats(id),
  PRIMARY KEY (traveler_id, seat_id)
);


INSERT INTO travelers (first_name, last_name)
VALUES ('Jennifer', 'Finch'), ('Thadeus', 'Gathercoal'), ('Sonja', 'Pauley'), ('Berkie', 'Wycliff'),
       ('Alvin', 'Leathes'), ('Cory', 'Squibbes');

INSERT INTO flights (departure, arrival, airline)
VALUES ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United');

INSERT INTO seats (seat_number, flight_id)
VALUES ('33B', 1);

INSERT INTO TravelersFlights (traveler_id, flight_id)
VALUES
  (1, 1), (2, 1), (3, 1), (1, 1), (3, 1), (3, 1), (4, 1), (5, 1), (4, 1), (6, 1)
ON CONFLICT (traveler_id, flight_id) DO NOTHING;

INSERT INTO TravelersSeats (traveler_id, seat_id)
VALUES
  (1, 1), (2, 1), (3, 1), (1, 1), (3, 1), (3, 1), (4, 1), (5, 1), (4, 1), (6, 1)
ON CONFLICT (traveler_id, seat_id) DO NOTHING;


INSERT INTO TravelersFlights (traveler_id, flight_id)
VALUES
  (1, 1), (2, 1), (3, 1), (1, 1), (3, 1), (3, 1), (4, 1), (5, 1), (4, 1), (6, 1)
ON CONFLICT (traveler_id, flight_id) DO NOTHING;
