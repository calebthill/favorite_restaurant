CREATE TABLE restaurants (
  id serial,
  name varchar(100) NOT NULL,
  meal_price int NOT NULL,
  address varchar(300),
  food_type varchar(250),
  launch_distance varchar(250),
  comments varchar(1000)
);
