-- Show all Ukrainian artists's info.
SELECT * FROM Artists
WHERE country = 'Ukraine'

-- Show the most popular genre by the number of tracks.
SELECT gs.name
FROM TrackGenres AS tg
JOIN Genres AS gs ON gs.genreid = tg.genreid
GROUP BY tg.genreid, gs.name
ORDER BY COUNT(*) DESC
LIMIT 1

-- Show the total duration of some album by it's name
SELECT al.name, SUM(tr.duration)
FROM albums AS al
JOIN tracks AS tr ON al.albumid = tr.albumid
WHERE al.name = 'Harmony'
GROUP BY al.name

-- Show the longest track in some album by name.
SELECT tr.name, tr.duration
FROM albums AS al
JOIN tracks AS tr ON al.albumid = tr.albumid
WHERE al.name = 'Harmony'
ORDER BY tr.duration DESC
LIMIT 1

-- Show top 3 artists by the number of albums.
SELECT ar.name, ar.surname
FROM albumartists AS aa
JOIN artists AS ar ON aa.artistid = ar.artistid
GROUP BY aa.artistid, ar.name, ar.surname
ORDER BY COUNT(*) DESC
LIMIT 3