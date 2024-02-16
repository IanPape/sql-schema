-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE travelers (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline TEXT NOT NULL,
  traveler_id INTEGER REFERENCES travelers(id)
);

CREATE TABLE TravelersFlights (
  traveler_id INTEGER REFERENCES travelers(id),
  flight_id INTEGER REFERENCES flights(id),
  PRIMARY KEY (traveler_id, flight_id)
);

INSERT INTO travelers (first_name, last_name)
VALUES ('Jennifer', 'Finch'), ('Thadeus', 'Gathercoal'), ('Sonja', 'Pauley'), ('Berkie', 'Wycliff'),
       ('Alvin', 'Leathes'), ('Cory', 'Squibbes');

INSERT INTO flights (seat, departure, arrival, airline, traveler_id)
VALUES
  ('33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 1);

INSERT INTO TravelersFlights (traveler_id, flight_id)
VALUES
  (1, 1), (2, 1), (3, 1), (1, 1), (3, 1), (3, 1), (4, 1), (5, 1), (4, 1), (6, 1)
ON CONFLICT (traveler_id, flight_id) DO NOTHING;
