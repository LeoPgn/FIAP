INSERT INTO ARTIST (artist_name, artist_type) VALUES ('The Weeknd', 'Pop')
INSERT INTO ARTIST (artist_name, artist_type) VALUES ('Tyler The Creator', 'Rap')
INSERT INTO ARTIST (artist_name, artist_type) VALUES ('Billie Eilish', 'Pop')

INSERT INTO TRACK (track_name, track_length, track_size, track_price, track_language, track_producer, track_songwriters, track_released, artist_id) VALUES ('Cant Feel My Face', 180, 180, 50, 'EN', NULL, NULL, '2015-06-15',1)
INSERT INTO TRACK (track_name, track_length, track_size, track_price, track_language, track_producer, track_songwriters, track_released, artist_id) VALUES ('Rise!', 180, 180, 50, 'EN', NULL, NULL, '2021-06-21',1)
INSERT INTO TRACK (track_language, track_length, track_name, track_price, track_producer, track_released, track_size, track_songwriters, artist_id) VALUES ('EN', 180, 'Happier Than Ever', 50, NULL, '2021-07-30', 180, NULL,1)

INSERT INTO ARTIST_TRACK (track_id, artist_id) VALUES (1,1)
INSERT INTO ARTIST_TRACK (track_id, artist_id) VALUES (2,1)
INSERT INTO ARTIST_TRACK (track_id, artist_id) VALUES (3,1)