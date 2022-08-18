SELECT DISTINCT u.usuario_name AS usuario,
IF(YEAR(MAX(h.historico_data)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM SpotifyClone.usuarios AS u
JOIN SpotifyClone.historicos_reproducao  AS h
ON u.usuario_id = h.usuario_id
GROUP BY u.usuario_name
ORDER BY u.usuario_name;