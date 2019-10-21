createdb batabase_test;
psql -d batabase_test -f lib/dump.sql;
psql -d batabase_test -f lib/update-db.sql;
bundle exec rails db:migrate
bundle exec rake seed:destroy_users;
bundle exec rake seed:create_users;
bundle exec rake seed:detection_targets;
bundle exec rake seed:target_descriptors;
bundle exec rake seed:study_areas;
bundle exec rake seed:county;
bundle exec rake seed:broad_habitats;
bundle exec rake seed:sample_units;
bundle exec rake seed:contact_state_id;
bundle exec rake seed:contact_organization_id;
bundle exec rake seed:contact_drop_columns;
