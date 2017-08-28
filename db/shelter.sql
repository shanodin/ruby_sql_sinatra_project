DROP TABLE IF EXISTS adoptions;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS pets;

CREATE TABLE owners(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  phone_number VARCHAR(255)
);

CREATE TABLE pets(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  breed VARCHAR(255),
  can_adopt BOOLEAN,
  status VARCHAR(255),
  admission_date VARCHAR(255),
  photo VARCHAR(255)
);

CREATE TABLE adoptions(
  id SERIAL PRIMARY KEY,
  owner_id INT REFERENCES owners(id),
  pet_id INT REFERENCES pets(id)
);
