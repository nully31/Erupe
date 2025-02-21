# Erupe Community Edition

This build is based on SU9.1 beta, and it has a bunch of features activated mainly for speedrunning.

The main changes are:

* You can activate prayer gems with desired effects and levels almost permanently.
    * To configure prayer gems, use `!song` and `!effect` commands in game chat.
    * For command details, take a look at and [`Kiju_list.csv`](./schema/Kiju_list.csv) and [`handlers_cast_binary.go`](./server/channelserver/handlers_cast_binary.go) .
    * After configuration, you may activate the gems by talking to the blue girl at the quest counter (you may have to change lobby to get the effects applied).
* Diva defense special guild hall is enabled.
* The exchange rate and the limit of GCP diva skills are modified (each item now only costs 1GCP, and lets you stack up to 255 instead of 10).
* Secret Tech usage no longer is saved in the database, though you still need to switch lobby to have it reset.

> ⚠️ **WARNING!!!**: 
I would strongly recommend to set up a whole new separate database for this build (see [Setup](#setup) below).

## Setup
### Requirements
- [Go](https://go.dev/dl/)
- [PostgreSQL](https://www.postgresql.org/download/) (default setup uses 14)
### Installation
1. Run [`schema\!DB-setup.bat`](./schema/!DB-setup.bat) to set up a new database.
    - If you already have a database named `erupe` for another build, edit the batch file to make the new database with a different name.
    - You may also have to edit your PostgreSQL path in the batch file in case you have another version than 14 installed.
2. Edit [config.json](./config.json) and enter the postgres password `"database" : { "password" : "<here>" }`.
2. Run `go build` or `go run .` to compile Erupe.
### Note
- You will need to acquire and install the client files and quest binaries separately.
# Resources
[Community FAQ Pastebin](https://pastebin.com/QqAwZSTC)

[Quests and Scenario Binary Files](https://github.com/xl3lackout/MHFZ-Quest-Files)
