psql -d postgres -c "DROP DATABASE batabase_development";
createdb batabase_development;
psql -d batabase_development -f lib/dump.sql;
psql -d batabase_development -f lib/update-db.sql;
bundle exec rails db:migrate
bundle exec rake seeds:destroy_users;
bundle exec rake seeds:create_users;
bundle exec rake initialize:contact_state_id;
bundle exec rake initialize:contact_organization_id;
bundle exec rake initialize:contact_drop_columns;
