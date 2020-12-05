# plant-tracker-api

## Dependencies

- Ruby `2.7.2`
- Rails `6.0.3.4`
- [Postgresql](https://www.postgresql.org/download/) `12.4`

## Setup

```
# Login as postgres user

# Linux
sudo -u postgres psql
# MacOS
psql postgres

# Create the required DB role
create role planttracker with createdb login password 'password';

# Create the databases
rake db:setup

# Seed data
rails db:migrate

# Run server
rails server

# Navigate to http://localhost:3000, the Rails success page should be displayed
```
