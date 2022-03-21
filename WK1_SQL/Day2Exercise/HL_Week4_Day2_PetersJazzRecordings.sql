 -- create a database
drop database Peters_Jazz_Records_And_CDs;
create database Peters_Jazz_Records_And_CDs;
use Peters_Jazz_Records_And_CDs;


-- create a table
create table artist (
    person_id smallint unsigned,
    fname varchar(20),
    lname varchar(20),
    nickname varchar(20),
    constraint pk_person primary key (person_id)
    );
    

-- creating a second table that references the 1st tables PK.  There doesn't seem to be a truly appropriate variable type for runtime/duration of the album so I've use decimal. 
create table album (
      person_id smallint unsigned,
      album_title varchar(100),
      year_of_release year, 
      runtime decimal (4,2),
      number_of_tracks smallint,
      constraint pk_album primary key (person_id, album_title), 
      constraint fk_album foreign key (person_id)
      references artist (person_id)
);


-- separate table for format avoids duplication of album details if have in more than one format
create table album_format (
      person_id smallint unsigned,
      album_title varchar(100),
      album_format varchar(15),
	  constraint pk_album_format primary key (album_title, album_format), 
      constraint fk_album_format foreign key (person_id, album_title)
      references album (person_id, album_title)
);

-- altering foreign key
-- Note: first line removes any foreign key links.alter
set foreign_key_checks=0;
-- Note: This is the main cog  of a table. 
alter table artist
    modify person_id smallint unsigned auto_increment;
--- Note: this reinstates the foreign key connections,
set foreign_key_checks=1;


insert into artist
    (person_id, fname, lname, nickname)
values 
  (NULL, 'Wynton', 'Marsalis', NULL),
  (NULL, 'Ornette', 'Coleman', NULL),
  (NULL, 'Miles', 'Davis', NULL),
  (NULL, 'Charlie', 'Parker', 'Bird'),
  (NULL, 'Chet', 'Baker', NULL),
  (NULL, 'Count', 'Basie', NULL),
  (NULL, 'Duke', 'Ellington', NULL),
  (NULL, 'Billie', 'Holiday', NULL),
  (NULL, 'Ella', 'Fitzgerald', NULL),
  (NULL, 'Dave', 'Brubeck', NULL),
  (NULL, 'Charles', 'Mingus', NULL);

-- check
-- select artist.person_id from artist where artist.fname = 'Wynton' and artist.lname = 'Marsalis' ;
-- select * from artist;

-- if using auto iterate on the primary key of the apex table this leads to the problem of transferring it to dependent tables. I've used a select command to pull the auto generated pk from the artist table.
insert into album
     (person_id, album_title, year_of_release, runtime, number_of_tracks)
values ((select artist.person_id from artist where artist.fname = 'Wynton' and artist.lname = 'Marsalis'), 'Marsalis Standard Time, Vol. I', 1987, 62.45, 12),
((select artist.person_id from artist where artist.fname = 'Ornette' and artist.lname = 'Coleman'), 'The Shape of Jazz to Come', 1959, 38.02, 6),
((select artist.person_id from artist where artist.fname = 'Chet' and artist.lname = 'Baker'), 'My Funny Valentine', 1994, 44.42, 14),
((select artist.person_id from artist where artist.fname = 'Charles' and artist.lname = 'Mingus'), 'Mingus Ah Um', 1959, 72.11, 12),
((select artist.person_id from artist where artist.fname = 'Miles' and artist.lname = 'Davis'), 'A Kind of Blue', 1959, 55.16, 6),
((select artist.person_id from artist where artist.fname = 'Dave' and artist.lname = 'Brubeck'), "Dave Brubeck's Greatest Hits", 1966, 43.37, 11);


-- vinyl record, CD, tape, mp3 etc.  This needs a separate table to avoid duplication of information in the case that the recording is owned in more than one format
insert into album_format
    (person_id, album_title, album_format)
values 
((select artist.person_id from artist where artist.fname = 'Wynton' and artist.lname = 'Marsalis'), 'Marsalis Standard Time, Vol. I', 'vinyl record'),
((select artist.person_id from artist where artist.fname = 'Wynton' and artist.lname = 'Marsalis'), 'Marsalis Standard Time, Vol. I', 'CD'),
((select artist.person_id from artist where artist.fname = 'Ornette' and artist.lname = 'Coleman'), 'The Shape of Jazz to Come', 'CD'),
((select artist.person_id from artist where artist.fname = 'Chet' and artist.lname = 'Baker'), 'My Funny Valentine', 'CD'),
((select artist.person_id from artist where artist.fname = 'Charles' and artist.lname = 'Mingus'), 'Mingus Ah Um', 'CD'),
((select artist.person_id from artist where artist.fname = 'Miles' and artist.lname = 'Davis'), 'A Kind of Blue', 'CD'),
((select artist.person_id from artist where artist.fname = 'Dave' and artist.lname = 'Brubeck'), "Dave Brubeck's Greatest Hits", 'CD');   
  
  select * from album_format; 
  select * from album;
  select * from artist;
  
   
    