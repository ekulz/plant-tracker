# plant-tracker-api

## Dependencies

- Ruby `2.7.2`
- Rails `6.0.3.4`
- [Postgresql](https://www.postgresql.org/download/) `12.4`

## Setup

```
# Create the required DB role
sudo -u postgres psql
create role planttracker with createdb login password 'password';

# Create the databases
rake db:setup

# Seed data
rails db:migrate

# Run server
rails server

# Navigate to http://localhost:3000, the Rails success page should be displayed
```
