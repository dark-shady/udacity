#Tournament_test.py usage:

* Install Vagrant according to [Instructions](https://classroom.udacity.com/courses/ud197/lessons/3423258756/concepts/14c72fe3-e3fe-4959-9c4b-467cf5b7c3a0)

* Open command line program for OS

* CD to vagrant directory

* Run commands:

  ```
  vagrant up
  vagrant ssh
  cd /vagrant/tournament
  psql
  \i tournament.sql
  python tournament_test.py
  ```
  
* All tests passed!



# Real world usage

* Install Vagrant according to [Instructions](https://classroom.udacity.com/courses/ud197/lessons/3423258756/concepts/14c72fe3-e3fe-4959-9c4b-467cf5b7c3a0)

* Open command line program for OS

* `CD` to vagrant directory

* Run commands to setup database:

  ```
  vagrant up
  vagrant ssh
  cd /vagrant/tournament
  psql
  \i tournament.sql
  ```

Use tournament.py to set up your tournament and get pairings and standings
  Register your players using registerPlayer("FIRST LASTNAME")
  Return standings with playerStandings()
  Record results of matches to the database with reportMatch(winner_id, loser_id)
  Find swiss pairings with swissPairings()

  Use deleteMatches(), deletePlayers(), countPlayers() as needed to reset the tournament
    or check your total number of registered users
