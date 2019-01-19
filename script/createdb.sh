psql -d postgres -c "DROP DATABASE batabase_development";
createdb batabase_development;
psql -d batabase_development -f lib/dump.sql;
psql -d batabase_development -f lib/update-db.sql;
bundle exec rails db:migrate
bundle exec rake seed:destroy_users;
bundle exec rake seed:create_users;
bundle exec rake seed:detection_targets;
bundle exec rake seed:target_descriptors;
bundle exec rake seed:study_areas;
bundle exec rake seed:county;
bundle exec rake initialize:contact_state_id;
bundle exec rake initialize:contact_organization_id;
bundle exec rake initialize:contact_drop_columns;

