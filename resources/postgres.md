1. which psql
2. brew install postgres
3. load postgresql
    - ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
    - launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

    -psql -l to see info about the db
4. load postgres console
    - psql
    - if db doesn't exist, createdb nameofdb

5. In config < database.yml
    adapter: postgresql
    username: records
    password: records
    database: records_development
    host: localhost
    pool: 5

    development:
      <<: *default
      database: records_development

    test:
      <<: *default
      database: records_test

    production:
      <<: *default
      database: records_production

6. change gem file
    from sqlite3 to pg

7. createuser records

8. go to 'psql' to set user record
    - ALTER USER records WITH PASSWORD 'records';
    OR
    - \password records

9. grant user ability to create dbs
    - ALTER USER records CREATEDB;

10. rake db:create && rake db:migrate && rake db:seed

11. psql records_development
12. `\d` shows list of relations
13. `\d albums`