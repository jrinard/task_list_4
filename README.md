Set up database

CREATE DATABASE to_do;

/c to_do

CREATE TABLE tasks (id serial PRIMARY KEY, description varchar, list_id int);

CREATE TABLE list (id serial PRIMARY KEY, name varchar);

CREATE DATABASE to_do_test WITH TEMPLATE to_do;




Database called to_do with
table called list      id           int    
                       name         varchar

table called tasks     id           int
                       description  varchar
                       list_id      int
