CREATE TABLE stores (
  id serial4 primary key,
  name VARCHAR(255),
  address VARCHAR(255),
  type VARCHAR(255)
);

CREATE TABLE pets (
  id serial4 primary key,
  name VARCHAR(255),
  pet_type VARCHAR(255),
  image VARCHAR(255),
  store_id SERIAL4 references stores(id)
);
