SELECT album_title, year_of_release FROM album
WHERE year_of_release BETWEEN 2018 AND 2018;

SELECT track_name, track_duration FROM music_track
ORDER BY track_duration DESC;

SELECT track_name FROM music_track
WHERE track_duration >= 03.50 * 60;

SELECT playlist_title  FROM playlist
WHERE year_of_playlist  BETWEEN 2018 AND 2020;

SELECT performer_name FROM performer
WHERE performer_name NOT LIKE '%% %%';

SELECT track_name FROM music_track
WHERE track_name LIKE '%%Мой%%';