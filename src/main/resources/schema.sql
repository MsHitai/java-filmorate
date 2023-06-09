CREATE TABLE IF NOT EXISTS GENRE (
	GENRE_ID INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
	NAME VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS RATING (
	RATING_ID INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
	NAME VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS FILMS (
  FILM_ID INTEGER AUTO_INCREMENT,
  NAME VARCHAR(100) NOT NULL,
  DESCRIPTION VARCHAR(200),
  RELEASE_DATE DATE NOT NULL,
  DURATION INTEGER NOT NULL,
  RATE INTEGER DEFAULT 0,
  RATING_ID INTEGER NOT NULL,
  CONSTRAINT FILMS_PK PRIMARY KEY (FILM_ID),
  CONSTRAINT RATING_PK FOREIGN KEY (RATING_ID) REFERENCES RATING
);

CREATE TABLE IF NOT EXISTS USERS (
	USER_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	EMAIL VARCHAR(100) NOT NULL,
	LOGIN VARCHAR(100) NOT NULL,
	NAME VARCHAR(100),
	BIRTHDAY DATE
);

CREATE TABLE IF NOT EXISTS LIKES (
	FILM_ID INT NOT NULL,
	USER_ID INT NOT NULL,
	CONSTRAINT FILM_PK FOREIGN KEY (FILM_ID) REFERENCES FILMS ON DELETE CASCADE,
    CONSTRAINT USER_PK FOREIGN KEY (USER_ID) REFERENCES USERS ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS FRIENDS (
	FRIEND_ID INT NOT NULL,
	USER_ID INT NOT NULL,
	STATUS VARCHAR (50),
	CONSTRAINT USER_PK2 FOREIGN KEY (USER_ID) REFERENCES USERS ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS GENRE_FILM (
	GENRE_ID INT NOT NULL,
	FILM_ID INT NOT NULL,
	CONSTRAINT FILM_FK FOREIGN KEY (FILM_ID) REFERENCES FILMS ON DELETE CASCADE
);