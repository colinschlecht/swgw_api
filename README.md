# README - SWGW API - v1


This is an API buit for the purpose of seeding the STAR WARS: GUESS WHO web application. 

The SWGW API was written in ruby 2.6.1 and relies on postgreSQL - see gemfile for dependencies.

To run this server, fork and clone this app and run bundle install. The database should be pre-seeded, however, if need be, run rails db:create, merge all the migrations via rails db:migrate, and follow the instructions in the seed file to reseed or reset the DB. 

Once completed - run 'rails -s' in the terminal to spin up a local version. 

API:
https://github.com/colinschlecht/swgw_api


FRONT END:
https://github.com/colinschlecht/starwarsguesswho


CREDIT: This API is a fork of a fork of the SWAPI https://github.com/colinschlecht/swapi-json-server; originally: https://github.com/phalt/swapi; 

https://swapi.dev/

All credit to those who put in the work before me. 

DISCLAIMER: 
This is not associated with Lucasfilm, Disney, Hasbro, etc. This was built purely for educational purposes by an aspiring software engineer, as a school project. Please contact the creator for any questions or concerns surrounding this app. 