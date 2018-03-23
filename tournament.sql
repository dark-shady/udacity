-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

-- Drops tournament table if it already exists and then recreates it
DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;
\c tournament
-- Players table containing
-- ID - unique ID for each player
-- Name - full name for player
CREATE TABLE players(
  id serial primary key,
  name text
);

-- Matches table containing
-- ID - unique identifier for the row
-- Winner - ID of winning player for the match.  References to players.id
-- Loser - ID of losing playuer for the match.  References to players.id
CREATE TABLE matches(
  id serial primary key,
  winner int REFERENCES players(id),
  loser int REFERENCES players(id)
);

-- Selects ID, Name, and counted wins
CREATE VIEW count_wins AS SELECT players.id, players.name, count(matches.winner) as wins
  FROM players LEFT JOIN matches ON players.id = matches.winner GROUP BY players.id;

-- Selects ID, Name, and counted matches
CREATE VIEW count_matches AS SELECT players.id, players.name, count(matches) as matches
  FROM players LEFT JOIN matches ON players.id = matches.winner OR players.id = matches.loser
  GROUP BY players.id;

--Selects id, name, wins, matches for all players and orders in descending order by wins
CREATE VIEW standings AS SELECT count_wins.id, count_wins.name, count_wins.wins, count_matches.matches
  FROM count_wins JOIN count_matches ON count_wins.id = count_matches.id ORDER BY count_wins.wins;
