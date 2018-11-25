cd lib/;
psql -d postgres -c "DROP DATABASE batabase_development";
createdb batabase_development;
psql -d batabase_development -f dump.sql;
psql -d batabase_development -f update-db.sql;
cd ..;
