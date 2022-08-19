SELECT ar.artista_name AS artista, a.album_name AS album,
COUNT(s.artista_id) AS seguidores
FROM  SpotifyClone.artistas AS ar
JOIN  SpotifyClone.albuns AS a
ON ar.artista_id = a.artista_id
JOIN SpotifyClone.seguindo_artistas AS s
ON ar.artista_id = s.artista_id
GROUP BY ar.artista_name, a.album_name
ORDER BY seguidores DESC, artista, album;