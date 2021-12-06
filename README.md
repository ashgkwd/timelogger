# Timelogger

> It is a Rails app that allows users to track their timings.

It is hosted at https://ashgkwd-timelogger.herokuapp.com/

## Basic usage

1. Create account
1. Sign in (if not already)
1. Click on "Clock In" to start your working hours
1. Click on "Clock Out" whenever you are done
1. On the home page you can see all the check ins you have done

## To run app locally

Add the following variables into your .env file

```sh
POSTGRES_PASSWORD=supersecretpassword
POSTGRES_USER=mainapp
HOST=localhost
PORT=3000
```

And then run the following commands

1. `docker-compose build`
1. `docker-compose up -d`
1. `docker-compose run web rake db:create`
1. `docker-compose run web rake db:migrate`
