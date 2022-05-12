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





INSERT INTO athletes VALUE (1, "Ron", "Kaminksy", "M", "Blue Mountain Community College");
INSERT INTO athletes VALUE (2, "Sally", "Donald", "F", "Treasure Valley Community College");
INSERT INTO athletes VALUE (3, "Avery", "Smith", "F", "Walla Walla Community College");
INSERT INTO athletes VALUE (4, "Kellen", "Dalley", "M", "Yakima Community College");
INSERT INTO athletes VALUE (5, "Rob", "Lund", "M", "Spokane Community College");
INSERT INTO athletes VALUE (6, "John", "Jensen", "M", "Treasure Valley Community College");
INSERT INTO athletes VALUE (7, "Keegan", "Barnes", "M", "Walla Walla Community College");
INSERT INTO athletes VALUE (8, "Arnold", "James", "M", "Yakima Community College");
INSERT INTO athletes VALUE (9, "Bailey", "Roberts", "F", "Blue Mountain Community College");
INSERT INTO athletes VALUE (10, "Kelsey", "Bales", "F", "Spokane Community College");
INSERT INTO athletes VALUE (11, "Aaron", "BogMire", "M", "North Idaho College");

select * from athletes;

INSERT INTO trackEvent VALUE (1, "100 Meter Dash", "running", "M");
INSERT INTO trackEvent VALUE (2, "100 Meter Dash", "running", "F");
INSERT INTO trackEvent VALUE (3, "Javelin", "field", "M");
INSERT INTO trackEvent VALUE (4, "Javelin", "field", "F");
INSERT INTO trackEvent VALUE (5, "400 Meter Dash", "running", "M");
INSERT INTO trackEvent VALUE (6, "400 Meter Dash", "running", "F");
INSERT INTO trackEvent VALUE (7, "Discus Throw", "field", "M");
INSERT INTO trackEvent VALUE (8, "Discus Throw", "field", "F");

select * from trackEvent;

INSERT INTO results VALUE (1, "Blue Mountain Community College", 1, 11.1, 1, 10, "No");
INSERT INTO results VALUE (4, "Yakima Community College", 1, 11.5, 2, 8, "No");
INSERT INTO results VALUE (10, "Spokane Community College", 2, 13.2, 1, 10, "No");
INSERT INTO results VALUE (3, "Walla Walla Community College", 2, 13.8, 2, 8, "No");
INSERT INTO results VALUE (5, "Spokane Community College", 3, 2282.4, 2, 8, "No");
INSERT INTO results VALUE (7, "Walla Walla Community College", 3, 2200.2, 5, 2, "No");
INSERT INTO results VALUE (10, "Spokane Community College", 4, NULL, NULL, 0, "Yes");
INSERT INTO results VALUE (9, "Blue Mountain Community College", 4, 1600.2, 2, 8, "No");
INSERT INTO results VALUE (8, "Yakima Community College", 5, 52.4, 3, 6, "No");
INSERT INTO results VALUE (6, "Treasure Valley Community College", 5, 50.3, 1, 10, "No");
INSERT INTO results VALUE (2, "Treasure Valley Community College", 6, 54.6, 2, 8, "No");
INSERT INTO results VALUE (3, "Walla Walla Community College", 6, 56.2, 5, 2, "No");
INSERT INTO results VALUE (5, "Spokane Community College", 7, 1968.5, 1, 10, "No");
INSERT INTO results VALUE (8, "Yakima Community College", 7, 1920.3, 4, 5, "No");
INSERT INTO results VALUE (2, "Treasure Valley Community College", 8, NULL, NULL, 0, "Yes");
INSERT INTO results VALUE (9, "Blue Mountain Community College", 8, 1502.36, 1, 10, "No");
INSERT INTO results VALUE (11, "North Idaho College", 7, 1902.36, 6, 1, "No");

select * from results;





