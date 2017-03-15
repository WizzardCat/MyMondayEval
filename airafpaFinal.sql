CREATE DATABASE airafpa;
USE airafpa;

CREATE USER 'airafpa'@'localhost' IDENTIFIED BY 'Choupidou31';

GRANT ALL PRIVILEGES ON airafpa.* TO 'airfpa'@'localhost' WITH GRANT OPTION


CREATE TABLE accesssite (client_number VARCHAR(32) NOT NULL PRIMARY KEY, user_password VARCHAR(32), id_fontion );
    INSERT INTO accesssite (client_number, user_password) VALUES ('C01159867234', '********');
    INSERT INTO accesssite (client_number, user_password) VALUES ('P89427421488', '*********');
    INSERT INTO accesssite (client_number, user_password) VALUES ('Q51354655411', '**********');
    INSERT INTO accesssite (client_number, user_password) VALUES ('R15216546532', '***********');
    INSERT INTO accesssite (client_number, user_password) VALUES ('M54546578997', '************');



CREATE TABLE accessbackoffice(employes_number VARCHAR(32) NOT NULL PRIMARY KEY, admin_password VARCHAR(32));
    INSERT INTO accessbackoffice (employes_number, admin_password) VALUES ('A32156111269', '*********');
    INSERT INTO accessbackoffice (employes_number, admin_password) VALUES ('A65641223596', '***********');
    INSERT INTO accessbackoffice (employes_number, admin_password) VALUES ('A98631322564', '************');
    INSERT INTO accessbackoffice (employes_number, admin_password) VALUES ('A65463235698', '*************');
    INSERT INTO accessbackoffice (employes_number, admin_password) VALUES ('986256498513', '**************');



CREATE TABLE rolesprivileges (admin BOOLEAN NOT NULL, bloqued BOOLEAN NOT NULL, employes_numbers VARCHAR(32) NOT NULL,
CONSTRAINT fk_employes_numbers FOREIGN KEY (employes_numbers) REFERENCES accessbackoffice(employes_number));
    INSERT INTO rolesprivileges (admin, bloqued, employes_numbers) VALUES (1, 0, 'A32156111269');
    INSERT INTO rolesprivileges (admin, bloqued, employes_numbers) VALUES (1, 0, 'A65641223596');
    INSERT INTO rolesprivileges (admin, bloqued, employes_numbers) VALUES (1, 0, 'A98631322564');
    INSERT INTO rolesprivileges (admin, bloqued, employes_numbers) VALUES (1, 0, 'A65463235698');
    INSERT INTO rolesprivileges (admin, bloqued, employes_numbers) VALUES (1, 0, '986256498513');



CREATE TABLE fonctions (id_fonction VARCHAR(32) NOT NULL PRIMARY KEY, name VARCHAR(32));
    INSERT INTO fonctions (id_fonction, name) VALUES (1, 'pilot');
    INSERT INTO fonctions (id_fonction, name) VALUES (2, 'copilot');
    INSERT INTO fonctions (id_fonction, name) VALUES (3, 'stewart or hostess');
    INSERT INTO fonctions (id_fonction, name) VALUES (4, 'stewart or hostess');
    INSERT INTO fonctions (id_fonction, name) VALUES (5, 'stewart or hostess');



CREATE TABLE users (users_id VARCHAR(32) NOT NULL PRIMARY KEY, user_lastname VARCHAR(32) NOT NULL, user_firstname VARCHAR(32) NOT NULL, user_adress VARCHAR(300) NOT NULL, city_name VARCHAR(85) NOT NULL, country_name VARCHAR(32) NOT NULL, phone_number VARCHAR(32) NOT NULL, user_email VARCHAR(32) NOT NULL, id_fonctions VARCHAR(32),
CONSTRAINT fk_id_fonctions FOREIGN KEY (id_fonctions) REFERENCES fonctions(id_fonction));
    INSERT INTO users (users_id, user_lastname, user_firstname, user_adress, city_name, country_name, phone_number, user_email) VALUES (1, 'Yamada', 'Kuren', '100-8994,Tôkyô Central Post Office, 5-3, Yaesu 1-Chome, Chuo-ku, Tôkyô 100-8994', 'Tôkyô', 'Japan', '+81 90 32 24 63 48', 'kuren.yamada@gmail.co.jp');
    INSERT INTO users (users_id, user_lastname, user_firstname, user_adress, city_name, country_name, phone_number, user_email) VALUES (2, 'Yoshimoto', 'Asao', '600-8216, Kyôto-fu, Kyôtô-shi, Shimogyô-ku, Higashi-Shiokôji 721-1', 'Kyôto', 'Japan', '+81 90 25 44 55 12', 'yoshimoto.asao@gmail.co.jp');
    INSERT INTO users (users_id, user_lastname, user_firstname, user_adress, city_name, country_name, phone_number, user_email) VALUES (3, 'Mamotori', 'Kirei', '600-8216, Kyôto-fu, Kyôto-shi, Shimogyō-ku, Karasuma-Shichijō-sagaru', 'Kyôto', 'Japan', '+81 90 98 75 14 63', 'kirei.mamotori@gmail.co.jp');
    INSERT INTO users (users_id, user_lastname, user_firstname, user_adress, city_name, country_name, phone_number, user_email) VALUES (4, 'Ueda', 'Konan', 'Sapporo-shi, Chūō-ku, Kita-5-jō Nishi-2-chōme 5-banchi', 'Sapporo', 'Japan', '+81 90 24 78 59 62', 'ueda.konan@gmail.co.jp');
    INSERT INTO users (users_id, user_lastname, user_firstname, user_adress, city_name, country_name, phone_number, user_email) VALUES (5, 'Komonogari', 'Yuka', '926-0192, Ishikawa-ken, Nanao-shi, Wakuramachi yo 80', 'Ishikawa', 'Japan', '+81 90 12 34 56 78', 'yuka.komonogari@gmail.co.jp');



CREATE TABLE airport (aita VARCHAR(3) NOT NULL PRIMARY KEY, city_names VARCHAR(85), country_names VARCHAR(32));
    INSERT INTO airport (aita, city_names, country_names) VALUES ('TLS', 'Toulouse', 'France');
    INSERT INTO airport (aita, city_names, country_names) VALUES ('NRT', 'Narita (Tôkyô)', 'Japan');
    INSERT INTO airport (aita, city_names, country_names) VALUES ('CDG', 'Paris', 'France');
    INSERT INTO airport (aita, city_names, country_names) VALUES ('CTS', 'Chitose (Sapporo)', 'Japan');
    INSERT INTO airport (aita, city_names, country_names) VALUES ('MRS', 'Marseille', 'France');



CREATE TABLE flies (flying_number BIGINT NOT NUll PRIMARY KEY, departure_date DATETIME, departure_airport VARCHAR(3) NOT NULL, arrival_airport VARCHAR(3) NOT NULL, duration_fly TIME NOT NULL, price DOUBLE NOT NULL, pilot_number VARCHAR(32), copilot_number VARCHAR(32), stewart_or_hostess_number1 VARCHAR(32), stewart_or_hostess_number2 VARCHAR(32), stewart_or_hostess_number3 VARCHAR(32), programmed BOOLEAN,
CONSTRAINT fk_departure_airport FOREIGN KEY (departure_airport) REFERENCES airport(aita),
CONSTRAINT fk_arrival_airport FOREIGN KEY (arrival_airport) REFERENCES airport(aita),
CONSTRAINT fk_pilot_number FOREIGN KEY (pilot_number) REFERENCES users (users_id),
CONSTRAINT fk_copilot_number FOREIGN KEY (copilot_number) REFERENCES users (users_id),
CONSTRAINT fk_stewart_or_hostess_number1 FOREIGN KEY (stewart_or_hostess_number1) REFERENCES users (users_id),
CONSTRAINT fk_stewart_or_hostess_number2 FOREIGN KEY (stewart_or_hostess_number2) REFERENCES users (users_id),
CONSTRAINT fk_stewart_or_hostess_number3 FOREIGN KEY (stewart_or_hostess_number3) REFERENCES users (users_id));
    INSERT INTO flies (flying_number,  departure_date, departure_airport, arrival_airport, duration_fly, price, pilot_number, copilot_number, stewart_or_hostess_number1, stewart_or_hostess_number2, stewart_or_hostess_number3) VALUES ('125983',  '2017-04-30', 'NRT', 'CDG', '745:00', '899.99', 1, 2, 3, 4, 5);
    INSERT INTO flies (flying_number,  departure_date, departure_airport, arrival_airport, duration_fly, price, pilot_number, copilot_number, stewart_or_hostess_number1, stewart_or_hostess_number2, stewart_or_hostess_number3) VALUES ('685921',  '2017-05-26', 'TLS', 'MRS', '60:00', '106.99', 1, 2, 3, 4, 5);
    INSERT INTO flies (flying_number,  departure_date, departure_airport, arrival_airport, duration_fly, price, pilot_number, copilot_number, stewart_or_hostess_number1, stewart_or_hostess_number2, stewart_or_hostess_number3) VALUES ('369875',  '2017-06-03', 'CTS', 'NRT', '95:00', '38.99', 1, 2, 3, 4, 5);
    INSERT INTO flies (flying_number,  departure_date, departure_airport, arrival_airport, duration_fly, price, pilot_number, copilot_number, stewart_or_hostess_number1, stewart_or_hostess_number2, stewart_or_hostess_number3) VALUES ('930155',  '2017-07-22', 'CDG', 'TLS', '70:00', '79.99', 1, 2, 3, 4, 5);
    INSERT INTO flies (flying_number,  departure_date, departure_airport, arrival_airport, duration_fly, price, pilot_number, copilot_number, stewart_or_hostess_number1, stewart_or_hostess_number2, stewart_or_hostess_number3) VALUES ('399233',  '2017-08-15', 'MRS', 'CTS', '850', '939.99', 1, 2, 3, 4, 5);



CREATE TABLE reservation (flying_numbers BIGINT, client_numbers VARCHAR(32), seat_numbers VARCHAR(90),
CONSTRAINT fk_flying_numbers FOREIGN KEY (flying_numbers) REFERENCES flies(flying_number),
CONSTRAINT fk_client_numbers FOREIGN KEY (client_numbers) REFERENCES accesssite(client_number));
    INSERT INTO reservation (flying_numbers, client_numbers, seat_numbers) VALUES ('125983', 'C01159867234', '32A');
    INSERT INTO reservation (flying_numbers, client_numbers, seat_numbers) VALUES ('685921', 'P89427421488', '65B');
    INSERT INTO reservation (flying_numbers, client_numbers, seat_numbers) VALUES ('369875', 'Q51354655411', '14C');
    INSERT INTO reservation (flying_numbers, client_numbers, seat_numbers) VALUES ('930155', 'R15216546532', '36A');
    INSERT INTO reservation (flying_numbers, client_numbers, seat_numbers) VALUES ('399233', 'M54546578997', '90B');

    

