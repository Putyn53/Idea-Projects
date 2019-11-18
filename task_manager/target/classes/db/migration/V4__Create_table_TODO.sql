CREATE TABLE TODO (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    text VARCHAR (30) NOT NULL,
    done BIT
);
INSERT INTO TODO (text, done) values ('Done todo', 1);
INSERT INTO TODO (text, done) values ('Undone', 0);