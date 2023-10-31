@echo off
color a
cd /d %~dp0

echo Please set pgAdmin path or database settings accordingly in this batch file if you want to customize configurations.
set PGPATH=C:\"Program Files"\PostgreSQL\14\bin\
set HOSTNAME=localhost
set PORTNUM=5432
set DBNAME=erupe2
set USERNAME=postgres
set /p PGPASSWORD="Enter the postgres password: "
echo;

echo --------------------------------------------------
echo                 Setting up database
echo --------------------------------------------------

%PGPATH%createdb -h %HOSTNAME% -p %PORTNUM% -U %USERNAME% %DBNAME%
%PGPATH%psql -h %HOSTNAME% -p %PORTNUM% -d %DBNAME% -U %USERNAME% -f SCHEMA.sql
%PGPATH%psql -h %HOSTNAME% -p %PORTNUM% -d %DBNAME% -U %USERNAME% -c "TRUNCATE normal_shop_items RESTART IDENTITY"
%PGPATH%psql -h %HOSTNAME% -p %PORTNUM% -d %DBNAME% -U %USERNAME% -c "COPY normal_shop_items FROM '%~dp0RoadShopItems.csv' with csv header encoding 'UTF8'"
%PGPATH%psql -h %HOSTNAME% -p %PORTNUM% -d %DBNAME% -U %USERNAME% -c "TRUNCATE kiju_list RESTART IDENTITY"
%PGPATH%psql -h %HOSTNAME% -p %PORTNUM% -d %DBNAME% -U %USERNAME% -c "COPY kiju_list FROM '%~dp0Kiju_list.csv' with csv header encoding 'UTF8'"

echo --------------------------------------------------
echo                     Setup done
echo --------------------------------------------------
echo  Press any key to exit... 
pause
exit