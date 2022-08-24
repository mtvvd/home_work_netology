-- количество исполнителей в каждом жанре
SELECT name_of_the_ganre, COUNT(performer_name) FROM performer p
JOIN performer_musical_ganre pmg ON p.performer_id = pmg.performer_id
JOIN musical_ganre mg ON pmg.musical_ganre_id = mg.musical_ganre_id 
GROUP BY name_of_the_ganre;

--количество треков, вошедших в альбомы 2019-2020 годов
SELECT year_of_release, COUNT(track_name) FROM album a
JOIN music_track mt ON a.album_id = mt.fk_album_id
WHERE a.year_of_release  >= 2019 AND a.year_of_release <= 2020
GROUP BY year_of_release;

--средняя продолжительность треков по каждому альбому
SELECT album_title, AVG(track_duration) FROM album a
JOIN music_track mt ON a.album_id = mt.fk_album_id
GROUP BY album_title;

--все исполнители, которые не выпустили альбомы в 2020 году
SELECT DISTINCT performer_name FROM album a
JOIN album_performer ap ON a.album_id = ap.album_id
JOIN performer p ON ap.performer_id = p.performer_id
WHERE a.year_of_release != 2020;

--названия сборников, в которых присутствует конкретный исполнитель (выберите сами)
SELECT DISTINCT playlist_title FROM playlist p 
JOIN playlist_music_track pmk ON p.playlist_id = pmk.playlist_id
JOIN music_track mt ON pmk.music_track_id = mt.music_track_id 
JOIN album a ON mt.fk_album_id = a.album_id
JOIN album_performer ap ON a.album_id = ap.album_id
JOIN performer ON ap.performer_id = performer.performer_id
WHERE performer.performer_name LIKE 'Макс Корж';

-- название альбомов, в которых присутствуют исполнители более 1 жанра
SELECT album_title FROM album a
JOIN album_performer ap ON a.album_id = ap.album_id
JOIN performer p ON ap.performer_id = p.performer_id
JOIN performer_musical_ganre pmk ON p.performer_id = pmk.performer_id
GROUP BY p.performer_name, a.album_title 
HAVING COUNT(pmk.musical_ganre_id) > 1;

-- наименование треков, которые не входят в сборники
SELECT track_name FROM music_track mt 
LEFT JOIN playlist_music_track pmk ON mt.music_track_id = pmk.music_track_id
WHERE pmk.music_track_id IS NULL;

--исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько)
SELECT p.performer_name, mt.track_duration FROM performer p 
JOIN album_performer ap ON p.performer_id = ap.performer_id
JOIN album a ON ap.album_id = a.album_id
JOIN music_track mt ON a.album_id = mt.fk_album_id
WHERE mt.track_duration IN (SELECT MIN(track_duration) FROM music_track);

--название альбомов, содержащих наименьшее количество треков
SELECT a.album_title, COUNT(mt.music_track_id) FROM album a
JOIN music_track mt ON a.album_id = mt.fk_album_id
GROUP BY a.album_title 
HAVING COUNT(mt.music_track_id) in (
	SELECT COUNT (mt.music_track_id)
	FROM album a
	JOIN music_track mt2 ON a.album_id = mt2.fk_album_id
	GROUP BY a.album_title 
	ORDER BY COUNT(mt2.music_track_id)
	LIMIT 1);



