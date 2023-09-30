@echo off
color a
cd /d %~dp0
set PGPATH=C:\"Program Files"\PostgreSQL\14\bin\
set HOSTNAME=localhost
set PORTNUM=5432
set DBNAME=erupe
set USERNAME=postgres
set /p PGPASSWORD="Enter the postgres password"
echo;

%PGPATH%psql -h %HOSTNAME% -p %PORTNUM% -d %DBNAME% -U %USERNAME% -f SONG_REWARD.sql
%PGPATH%psql -h %HOSTNAME% -p %PORTNUM% -d %DBNAME% -U %USERNAME% -c "TRUNCATE kiju_list RESTART IDENTITY"
%PGPATH%psql -h %HOSTNAME% -p %PORTNUM% -d %DBNAME% -U %USERNAME% -c "COPY kiju_list FROM '%~dp0Kiju_list.csv' with csv header encoding 'UTF8'"

echo --------------------------------------------------
echo                     Setup done
echo --------------------------------------------------
echo  Press any key to exit... 
pause
exit