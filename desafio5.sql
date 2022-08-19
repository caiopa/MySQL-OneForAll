SELECT c.cancao_name AS cancao, COUNT(h.cancao_id) AS reproducoes
FROM SpotifyClone.cancoes AS c
JOIN SpotifyClone.historicos_reproducao AS h
ON c.cancao_id = h.cancao_id
GROUP BY c.cancao_name
ORDER BY reproducoes DESC, c.cancao_name
LIMIT 2
