CREATE TABLE IF NOT EXISTS musical_ganre (
	musical_ganre_id INT PRIMARY KEY,
	name_of_the_ganre VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS performer (
	performer_id INT PRIMARY KEY,
	performer_name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS album (
	album_id INT PRIMARY KEY,
	album_title VARCHAR(60) NOT NULL,
	year_of_release DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS music_track (
	music_track_id INT PRIMARY KEY,
	track_name VARCHAR(60) NOT NULL,
	track_duration INT NOT NULL,
	fk_album_id INT REFERENCES album(album_id) NOT NULL
);

CREATE TABLE IF NOT EXISTS playlist (
	playlist_id INT PRIMARY KEY,
	playlist_title VARCHAR(60) NOT NULL,
	year_of_playlist DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS playlist_music_track (
	playlist_id INT REFERENCES playlist(playlist_id),
	music_track_id INT REFERENCES music_track(music_track_id),
	CONSTRAINT playlist_music_track_pk PRIMARY KEY(playlist_id, music_track_id)
);

CREATE TABLE IF NOT EXISTS album_performer (
	album_id INT REFERENCES album(album_id),
	performer_id INT REFERENCES performer(performer_id),
	CONSTRAINT album_performer_pk PRIMARY KEY(album_id, performer_id)
);

CREATE TABLE IF NOT EXISTS performer_musical_ganre (
	performer_id INT REFERENCES performer(performer_id),
	musical_ganre_id INT REFERENCES musical_ganre(musical_ganre_id),
	CONSTRAINT performer_musical_ganre_pk PRIMARY KEY(performer_id, musical_ganre_id)
);






