DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS animals;

CREATE TABLE owners(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  phone_number VARCHAR(255)
);

CREATE TABLE animals(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  can_adopt BOOLEAN,
  status VARCHAR(255),
  owner_id INT REFERENCES owners(id),
  admission_date VARCHAR(255)
);
