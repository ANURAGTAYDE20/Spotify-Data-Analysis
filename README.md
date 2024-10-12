Spotify Data Analysis Case Study

Project Overview
This project involves analyzing a Spotify dataset containing over 20,000 rows to identify trends in streams, audience engagement, and artist performance across platforms. The analysis is performed using SQL and focuses on answering a series of business-critical questions. Key areas of focus include the performance of artists on Spotify and YouTube, track popularity, and collaboration impact.

Problem Statements
The project addresses the following key business problems:
1.	Track Popularity: Retrieve the names of all tracks that have more than 1 billion streams on Spotify.
o	Query: Used simple SQL filtering to identify tracks with exceptional popularity on Spotify.
2.	Artist & Album Analysis: List all albums along with their respective artists.
o	Query: Aimed at providing a complete list of artists and albums to understand catalog size and diversity.
3.	Engagement Metrics: Calculate the total number of comments for tracks where licensed = TRUE.
o	Query: Focused on understanding user engagement in licensed tracks through comment metrics.
4.	Album Type Segmentation: Identify all tracks belonging to the album type single.
o	Query: Segmented the dataset to analyze trends in single releases versus full albums.
5.	Artist Track Count: Count the total number of tracks produced by each artist.
o	Query: Aggregated data to highlight the productivity of artists based on track counts.
6.	Track Features Analysis: Calculate the average danceability of tracks in each album.
o	Query: Provided insights into the overall danceability of albums, potentially identifying audience preferences.
7.	Track Energy: Identify the top 5 tracks with the highest energy values.
o	Query: Showcased the most energetic tracks, aiding in playlist curation and marketing strategies.
8.	Total Views by Album: For each album, calculate the total views of all associated tracks.
o	Query: Highlighted which albums have garnered the most attention based on track views.
9.	Cross-Platform Performance: Retrieve the track names that have been streamed more on Spotify than YouTube.
o	Query: Used a CTE to compare streaming performance across platforms, identifying tracks more popular on Spotify.
10.	Top 3 Most-Viewed Tracks Per Artist: Find the top 3 most-viewed tracks for each artist using window functions.
o	Query: Used DENSE_RANK() to rank the top tracks for each artist, helping stakeholders identify key tracks driving artist popularity.
11.	Energy and Danceability: Identify the top 10 songs based on both energy and danceability using ranking.
o	Query: Provided insights into tracks that are both energetic and danceable, ideal for high-energy playlists.
12.	Dominant Artists Across Platforms: Identify artists dominating both Spotify and YouTube based on total streams and views.
o	Query: Compared cross-platform dominance by analyzing artists with 50 million+ streams and views on both platforms.
13.	Artist Collaborations: Identify which collaborations between artists have resulted in the highest combined streams.
o	Query: Used STRING_AGG to list collaborating artists and their total combined streams, highlighting the success of multi-artist tracks.

Dataset
•	Rows: 20,000+
•	Columns: 24
•	Key fields: Track, Artist, Album, Stream, Views, Likes, Comments, Danceability, Energy, Loudness, and platform-specific metrics like most_playedon (Spotify/YouTube).

SQL Techniques
•	Common Table Expressions (CTEs): Simplified multi-step queries like comparing streams across platforms and filtering results.
•	Window Functions: Used to rank top tracks for each artist, calculate track popularity based on energy and danceability, and identify collaborations.
•	Aggregations: Summed streams, views, and comments to highlight the top-performing tracks, albums, and artists.
•	String Aggregation: Combined artist names to analyze collaborative tracks.

Results
1.	Top Tracks: Identified tracks with 1 billion+ streams, providing stakeholders with a list of the most popular content on Spotify.
2.	Cross-Platform Performance: Found artists with 50 million+ streams and views on both Spotify and YouTube, showing cross-platform success.
3.	Artist Collaborations: Highlighted the top 10 artist collaborations by combined streams, offering insights into collaborative success.
4.	Track Energy and Danceability: Ranked the top 10 tracks based on energy and danceability, offering recommendations for high-energy playlists.

Conclusion
The project successfully uncovered actionable insights into Spotify's music catalog, focusing on track popularity, artist performance, and collaboration success. These insights can help stakeholders optimize artist promotion, curate engaging playlists, and enhance cross-platform marketing strategies.

