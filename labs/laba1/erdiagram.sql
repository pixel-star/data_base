CREATE TABLE "customer" (
  "id" serial PRIMARY KEY,
  "name" varchar,
  "last_name" varchar,
  "pasport_id" int,
  "home_address" varchar
);

CREATE TABLE "model" (
  "id" serial PRIMARY KEY,
  "model" varchar,
  "brend" varchar,
  "color" varchar
);

CREATE TABLE "cars" (
  "id" serial PRIMARY KEY,
  "model_id" int,
  "car_number" int,
  "rented" bool
);

CREATE TABLE "contract" (
  "id" serial PRIMARY KEY,
  "car_id" int,
  "date_contract" date,
  "date_end" date,
  "client_id" int,
  "subscription" bool,
  "price" int
);

CREATE TABLE "accidens" (
  "contract_id" int,
  "date_dtp" date,
  "result" varchar
);

ALTER TABLE "contract" ADD FOREIGN KEY ("client_id") REFERENCES "customer" ("id");

ALTER TABLE "accidens" ADD FOREIGN KEY ("contract_id") REFERENCES "contract" ("id");

ALTER TABLE "contract" ADD FOREIGN KEY ("car_id") REFERENCES "cars" ("id");

ALTER TABLE "cars" ADD FOREIGN KEY ("model_id") REFERENCES "model" ("id");
