# Erupe Community Edition

This fork is based on SU9.1 beta, and has diva prayer gems/diva defense special guild hall enabled, and also have diva skill exchange rate modified.
To configure prayer gems, use `!song` and `!effect` commands in game chat (for details, take a look at and [`Kiju_list.csv`](./schema/Kiju_list.csv) and [`handlers_cast_binary.go`](./server/channelserver/handlers_cast_binary.go) ) and activate normally at the quest counter (blue girl, you may have to change your land to see the changes).

> ⚠️ **WARNING!!!**: 
I would strongly recommend to set up a whole new separate database for this build (see [Setup](#setup) below).

## Setup
### Requirements
- [Go](https://go.dev/dl/)
- [PostgreSQL](https://www.postgresql.org/download/)
### Installation
1. Run [`schema\!DB-setup.bat`](./schema/!DB-setup.bat) to set up the new database.
    - If you already have a database named `erupe` for another build, edit the batch file to make a new database with a different name.
    - You may also have to edit your PostgreSQL path in the batch file in case you have other versions than 14 installed.
2. Edit [config.json](./config.json) such that the database password matches your PostgreSQL setup.
2. Run `go build` or `go run .` to compile Erupe.
### Note
- You will need to acquire and install the client files and quest binaries separately.
# Resources
[Community FAQ Pastebin](https://pastebin.com/QqAwZSTC)

[Quests and Scenario Binary Files](https://github.com/xl3lackout/MHFZ-Quest-Files)
