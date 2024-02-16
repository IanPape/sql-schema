
DROP DATABASE IF EXISTS outer_space;


CREATE DATABASE outer_space;


\c outer_space


CREATE TABLE galaxies (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE moons (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL

);

CREATE TABLE planets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    orbital_period_in_years FLOAT NOT NULL,
    orbits_around INTEGER REFERENCES planets(id),
    galaxy_id INTEGER REFERENCES galaxies(id),
    moons INTEGER[] REFERENCES moons(id) ARRAY
);

INSERT INTO galaxies (name)
VALUES
  ('Milky Way');

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy_id, moons)
VALUES
  ('Earth', 1.00, NULL, 1, '{"The Moon"}'),
  ('Mars', 1.88, NULL, 1, '{"Phobos", "Deimos"}'),
  ('Venus', 0.62, NULL, 1, '{}'),
  ('Neptune', 164.8, NULL, 1, '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 0.03, 5, 1, '{}'),
  ('Gliese 876 b', 0.23, 6, 1, '{}');
