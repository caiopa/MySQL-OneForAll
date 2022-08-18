SELECT u.usuario_name AS usuario, COUNT(h.cancao_id) AS qt_de_musicas_ouvidas,
ROUND(SUM(m.cancao_duracao/60),2) AS total_minutos
FROM SpotifyClone.usuarios AS u
JOIN SpotifyClone.historicos_reproducao AS h
ON u.usuario_id = h.usuario_id
JOIN SpotifyClone.cancoes AS m
ON h.cancao_id = m.cancao_id
GROUP BY u.usuario_name
ORDER BY u.usuario_name; 