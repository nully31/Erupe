@echo off
chcp 65001
color a
cd /d %~dp0
rem DB接続パラメータ
set PGPATH=C:\"Program Files"\PostgreSQL\14\bin\
set HOSTNAME=localhost
set PORTNUM=5432
set DBNAME=erupe
set USERNAME=postgres
echo --------------------------------------------------
echo               DB接続パラメータ設定
echo --------------------------------------------------
echo  ※ここから入力する数値は全て半角文字でお願いします。 
set /p PGPASSWORD="Postgresのpasswordを入力してください："
echo;

%PGPATH%psql -h %HOSTNAME% -p %PORTNUM% -d %DBNAME% -U %USERNAME% -f SONG_REWARD.sql
%PGPATH%psql -h %HOSTNAME% -p %PORTNUM% -d %DBNAME% -U %USERNAME% -c "TRUNCATE kiju_list RESTART IDENTITY"
%PGPATH%psql -h %HOSTNAME% -p %PORTNUM% -d %DBNAME% -U %USERNAME% -c "COPY kiju_list FROM '%~dp0Kiju_list.csv' with csv header encoding 'UTF8'"

echo --------------------------------------------------
echo                     ALL DONE
echo --------------------------------------------------
echo  何かキーを押すと終了します。 
pause
exit