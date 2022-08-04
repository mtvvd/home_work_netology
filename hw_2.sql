create table if not exists musical_ganre (
	musical_ganre_id int primary key,
	name_of_the_ganre text not null
);

create table if not exists performer (
	performer_id int primary key,
	performer_name text not null,
	fk_musical_ganre_id int references musical_ganre(musical_ganre_id) not null
);

create table if not exists album (
	album_id int primary key,
	album_title text not null,
	year_of_release date not null,
	fk_performer_id int references performer(performer_id) not null
);

create table if not exists music_track (
	music_track_id int primary key,
	track_name text not null,
	track_duration time not null,
	fk_album_id int references album(album_id) not null
);

create table if not exists playlist (
	playlist_id int primary key,
	playlist_title text not null,
	year_of_playlist date not null,
	fk_music_track_id int references music_track(music_track_id) not null
);

create table if not exists album_performer (
	album_id int references album(album_id),
	performer_id int references performer(performer_id),
	constraint album_performer_pk primary key(album_id, performer_id)
);

create table if not exists performer_musical_ganre (
	performer_id int references performer(performer_id),
	musical_ganre_id int references musical_ganre(musical_ganre_id),
	constraint performer_musical_ganre_pk primary key(performer_id, musical_ganre_id)
);






