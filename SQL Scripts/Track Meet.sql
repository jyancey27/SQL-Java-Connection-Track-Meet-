use dbyanceytrack;

drop trigger if exists limitTrackTable;
drop trigger if exists bannedAthlete;
drop table if exists points;
drop table if exists results;
drop table if exists trackEvent;
drop table if exists athletes;

create table athletes (athleteId int NOT NULL UNIQUE, 
firstName varchar(20) NOT NULL, lastName varchar(20) NOT NULL, 
gender enum('M','F') NOT NULL, school varchar(40) NOT NULL,
Primary key (athleteId));

create table trackEvent (eventId int NOT NULL unique check (eventId between 1 and 17), 
eventName varchar(20) NOT NULL, eventType enum('running','field') NOT NULL, 
eventGender enum('M','F') NOT NULL,
primary key (eventId));

create table results (athleteId int, school varchar(40) NOT NULL,
eventId int, eventTime DECIMAL(6,2), place int, 
points int NOT NULL check (points between 0 and 10), disqualified ENUM("No","Yes") NOT NULL,
foreign key (athleteId) references athletes (athleteId),
foreign key (eventId) references trackEvent (eventId));



delimiter //
create trigger bannedSchool
before insert on results
for each row
begin
	if new.school = "North Idaho College" then
		SET new.disqualified = "Yes";
        SET new.place = NULL;
        SET new.points = 0;
	end if;
end //
delimiter ;

show triggers;





