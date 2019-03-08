### Development Setup

1. Login with Geoff's Heroku account with `heroku login`
2. Make sure you have Postgres installed locally
3. Pull from the Heroku database: `heroku pg:pull DATABASE_URL true-dot-ink_development --app truedotink`
4. Add a master key so you can use the config variables.
  - Go to the Heroku app settings > Config Vars > Reveal Config Vars
  - Copy the value of `RAILS_MASTER_KEY`
  - Add this key to a local master key file: `echo [master key] > ./config/master.key`