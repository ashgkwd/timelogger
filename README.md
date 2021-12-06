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

# Q&A

## Please describe your process for approaching the code challenge. What kind of planning did you do? Did your plans change as you began coding?

I started with drawing endpoints and schema for given use cases. After few iterations I finalised on the schema. Then I started looking into the stack that I can use to complete the requirements in the given time. I chose the stack that I'm familiar with and made few modifications from my usual work flows. For example, I would create frontend in React in general and then use Nginx to take care of serving static files and act as reverse proxy for the backend server. But due to time restrictions, I decided to go with all Rails approach.

I started with docker setup, followed by skeletan rails app and then devise gem to get user auth working. After that I setup heroku to deploy from GitHub. Once all the supporting things came into place, I started with main business logic implementation. As I was short on time, I did not spend much on the UI.

## Describe the schema design you chose. Why did you choose this design? What other alternatives did you consider?

A timelog made by user is represented as acontinuous block of time bounded by start and end time. This goes well with the context of the usecase. Initially I thought of storing a single entry of check (in or out) with direction as one column to indicate if it's start or end of the time block. But later on shifted to storing both clock in and clock out timings in the same record. This simplified validaiton of the inputs.

## If you were given another day to work on this, how would you spend it? What if you were given a month?

With few more days at my disposal, I could have made a more roboust applicaiton especially by improving test case coverage and data display. With one month timing, the feature set of the application can be fine tuned especially by getting into details of how users will use the applicaiton in real life. In the past I've worked on a fingerprint based clocking app which had similar functionalities but much greater scope of real life use cases. So I belive that in a month long time, I can cover boundary cases and provide JSON API (jbuilder) responses to enable integration with mobile clients.
