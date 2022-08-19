SELECT ar.artista_name AS artista, a.album_name AS album
FROM SpotifyClone.artistas AS ar
JOIN SpotifyClone.albuns AS a
ON ar.artista_id = a.artista_id
WHERE ar.artista_name = 'Elis Regina'