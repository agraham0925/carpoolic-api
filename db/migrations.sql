DROP DATABASE IF EXISTS carpoolic;

CREATE DATABASE carpoolic;

\c carpoolic

CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	username VARCHAR(64) NOT NULL UNIQUE,
	password_digest VARCHAR(64),
	email VARCHAR(64) NOT NULL
);

CREATE TABLE rides (
	id SERIAL PRIMARY KEY,
	name VARCHAR(128),
	pickup VARCHAR(128) NOT NULL,
	destination VARCHAR(128) NOT NULL,
	pickup_date DATE NOT NULL,
	pickup_time VARCHAR(12) NOT NULL,
	driver_user_id INT REFERENCES users(id),
	passenger_slots SMALLINT NOT NULL
);

CREATE TABLE rides_users (
	id SERIAL PRIMARY KEY,
	user_id INT REFERENCES users(id),
	ride_id INT REFERENCES rides(id)
);
