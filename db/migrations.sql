CREATE DATABASE car_finder;
\c car_finder
CREATE TABLE saved_cars (id SERIAL PRIMARY KEY, plate varchar(255), state varchar(255), make varchar(255), model varchar(255), style varchar(255), color varchar(255), id_of_user integer);
CREATE TABLE accounts (id SERIAL PRIMARY KEY, user_name varchar(255), user_email varchar(255), password_digest varchar(255));
