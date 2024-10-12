SELECT * FROM spotify

--Q1. Retrieve the names of all tracks that have more than 1 billion streams.

SELECT *
from spotify 
where stream > 1000000000

--Q2 List all albums along with their respective artists.

SELECT DISTINCT album , artist
from spotify


--Q3 Get the total number of comments for tracks where licensed = TRUE.

SELECT 
   SUM(comments) as total_comments
from spotify 
where Licensed =1 

--Q4 Find all tracks that belong to the album type single.

SELECT *
from spotify
where Album_type = 'single'

--Q5.Count the total number of tracks by each artist.

SELECT Artist ,count(track) as total_no_of_tracks
from spotify
GROUP BY Artist
ORDER BY total_no_of_tracks desc

--Q6.Calculate the average danceability of tracks in each album.

SELECT Album ,ROUND(AVG(Danceability),3) as average_danceability
FROM spotify
GROUP BY Album
ORDER BY average_danceability desc

--Q7. Find the top 5 tracks with the highest energy values

SELECT TOP 5 track , ROUND(MAX(energy),3) as highest_energy
from spotify
group by track
order by highest_energy desc

--Q8 . For each album, calculate the total views of all associated tracks.

SELECT album ,track ,  SUM(views) as total_views
FROM spotify
group by album , track
ORDER BY total_views desc

--Q9.Retrieve the track names that have been streamed on Spotify more than YouTube.

with cte as (
SELECT track , 
 COALESCE(SUM(CASE WHEN most_playedon = 'Spotify' THEN stream end ),0) as streamed_on_spotify
,COALESCE(SUM(CASE WHEN most_playedon = 'Youtube' THEN stream end ),0) as streamed_on_youtube 
from spotify
GROUP BY track
) 

SELECT * 
from cte 
where streamed_on_spotify > streamed_on_youtube AND streamed_on_youtube <> 0
 
-- Q10 .Find the top 3 most-viewed tracks for each artist using window functions.

with cte as (
SELECT artist, track, SUM(views) as total_views , 
DENSE_RANK() over (partition by artist order by SUM(views) desc )  as rn
from spotify
group by artist , track
)

SELECT * FROM cte 
WHERE rn <= 3 

--Q11 Find top 10 songs which are most popular based on energy and danceability?

SELECT TOP 10 
track , 
energy ,
Danceability
,RANK() over (order by energy desc ,Danceability desc ) as rn
from spotify

--12.Which artists dominate both Spotify and YouTube, based on total streams and views?

With artist_performance as (
SELECT artist , 
SUM(CASE WHEN most_playedon = 'Spotify' THEN stream else 0 end ) as total_spotify_streams,
SUM(CASE WHEN most_playedon = 'Youtube' THEN Views else 0 end ) as total_youtube_views
FROM spotify 
group by artist 
)

SELECT artist , total_spotify_streams , total_youtube_views
from artist_performance
where total_spotify_streams > 50000000 AND total_youtube_views > 50000000
ORDER BY total_spotify_streams DESC, total_youtube_views DESC;


--Q13.Which collaborations between artists have resulted in the highest combined streams?

WITH collaboration_streams AS (
  SELECT Track, 
         STRING_AGG(Artist, ', ') AS artists, 
         SUM(Stream) AS total_streams
  FROM spotify
  GROUP BY Track
  HAVING COUNT(DISTINCT Artist) > 1
)
SELECT TOP 10 artists, total_streams
FROM collaboration_streams
ORDER BY total_streams DESC









