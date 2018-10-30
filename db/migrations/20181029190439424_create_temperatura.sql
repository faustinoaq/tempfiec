-- +micrate Up
CREATE TABLE temperaturas (
  id BIGSERIAL PRIMARY KEY,
  grados FLOAT,
  frecuencia INT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS temperaturas;
