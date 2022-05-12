use dbyanceytrack;

INSERT INTO athletes (firstName, lastName, gender, School, SchoolId) VALUES ("Ron", "Kaminksy", "M", "Blue Mountain Community College", 1);
INSERT INTO athletes (firstName, lastName, gender, School, SchoolId) VALUES ("Bill", "Shaunder", "M", "Blue Mountain Community College", 1);
INSERT INTO athletes (firstName, lastName, gender, School, SchoolId) VALUES ("Brock", "Honsley", "M", "Blue Mountain Community College", 1);
INSERT INTO athletes (firstName, lastName, gender, School, SchoolId) VALUES ("Sally", "Donald", "F", "Treasure Valley Community College", 2);
INSERT INTO athletes (firstName, lastName, gender, School, SchoolId) VALUES ("Helen", "Prockish", "F", "Treasure Valley Community College", 2);
INSERT INTO athletes (firstName, lastName, gender, School, SchoolId) VALUES ("Hailey", "Johns", "F", "Treasure Valley Community College", 2);
INSERT INTO athletes (firstName, lastName, gender, School, SchoolId) VALUES ("Avery", "Smith", "F", "Walla Walla Community College", 3);
INSERT INTO athletes (firstName, lastName, gender, School, SchoolId) VALUES ("Mackenzie", "Smith", "F", "Walla Walla Community College", 3);
INSERT INTO athletes (firstName, lastName, gender, School, SchoolId) VALUES ("Maya", "Cruz", "F", "Walla Walla Community College", 3);
INSERT INTO athletes (firstName, lastName, gender, School, SchoolId) VALUES ("Kellen", "Dalley", "M", "Yakima Community College", 4);
INSERT INTO athletes (firstName, lastName, gender, School, SchoolId) VALUES ("Tyson", "Fergone", "M", "Yakima Community College", 4);
INSERT INTO athletes (firstName, lastName, gender, School, SchoolId) VALUES ("Josh", "Allen", "M", "Yakima Community College", 4);
INSERT INTO athletes (firstName, lastName, gender, School, SchoolId) VALUES ("Rob", "Lund", "M", "Spokane Community College", 5);
INSERT INTO athletes (firstName, lastName, gender, School, SchoolId) VALUES ("Hector", "Guado", "M", "Spokane Community College", 5);
INSERT INTO athletes (firstName, lastName, gender, School, SchoolId) VALUES ("Austin", "Kerrigan", "M", "Spokane Community College", 5);
INSERT INTO athletes (firstName, lastName, gender, School, SchoolId) VALUES ("John", "Jensen", "M", "Treasure Valley Community College", 2);
INSERT INTO athletes (firstName, lastName, gender, School, SchoolId) VALUES ("Tucker", "Alfred", "M", "Treasure Valley Community College", 2);
INSERT INTO athletes (firstName, lastName, gender, School, SchoolId) VALUES ("Taylor", "William", "M", "Treasure Valley Community College", 2);
INSERT INTO athletes (firstName, lastName, gender, School, SchoolId) VALUES ("Keegan", "Barnes", "M", "Walla Walla Community College", 3);
INSERT INTO athletes (firstName, lastName, gender, School, SchoolId) VALUES ("Nelson", "Cruz", "M", "Walla Walla Community College", 3);
INSERT INTO athletes (firstName, lastName, gender, School, SchoolId) VALUES ("Juan", "Benitez", "M", "Walla Walla Community College", 3);
INSERT INTO athletes (firstName, lastName, gender, School, SchoolId) VALUES ("Arnold", "James", "M", "Yakima Community College", 4);
INSERT INTO athletes (firstName, lastName, gender, School, SchoolId) VALUES ("Meagan", "Romanno", "M", "Yakima Community College", 4);
INSERT INTO athletes (firstName, lastName, gender, School, SchoolId) VALUES ("Emily", "Wilson", "M", "Yakima Community College", 4);
INSERT INTO athletes (firstName, lastName, gender, School, SchoolId) VALUES ("Bailey", "Roberts", "F", "Blue Mountain Community College", 1);
INSERT INTO athletes (firstName, lastName, gender, School, SchoolId) VALUES ("Shauna", "Hurts", "F", "Blue Mountain Community College", 1);
INSERT INTO athletes (firstName, lastName, gender, School, SchoolId) VALUES ("Jackie", "Smith", "F", "Blue Mountain Community College", 1);
INSERT INTO athletes (firstName, lastName, gender, School, SchoolId) VALUES ("Kelsey", "Bales", "F", "Spokane Community College", 5);
INSERT INTO athletes (firstName, lastName, gender, School, SchoolId) VALUES ("Mina", "Lopez", "F", "Spokane Community College", 5);
INSERT INTO athletes (firstName, lastName, gender, School, SchoolId) VALUES ("Kerri", "Joshua", "F", "Spokane Community College", 5);
INSERT INTO athletes (firstName, lastName, gender, School, SchoolId) VALUES ("Aaron", "BogMire", "M", "North Idaho College", 6);


select * from athletes;

INSERT INTO trackEvent VALUE (1, "100 Meter Dash", "running", "M");
INSERT INTO trackEvent VALUE (2, "100 Meter Dash", "running", "F");
INSERT INTO trackEvent VALUE (3, "Javelin", "field", "M");
INSERT INTO trackEvent VALUE (4, "Javelin", "field", "F");
INSERT INTO trackEvent VALUE (5, "400 Meter Dash", "running", "M");
INSERT INTO trackEvent VALUE (6, "400 Meter Dash", "running", "F");
INSERT INTO trackEvent VALUE (7, "Discus Throw", "field", "M");
INSERT INTO trackEvent VALUE (8, "Discus Throw", "field", "F");
INSERT INTO trackEvent VALUE (9, "800 Meter Dash", "running", "M");
INSERT INTO trackEvent VALUE (10, "800 Meter Dash", "running", "F");

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
INSERT INTO results VALUE (12, "Yakima Community College", 8, 1502.36, 1, 10, "No");
INSERT INTO results VALUE (13, "Blue Mountain Community College", 8, 1502.36, 1, 10, "No");
INSERT INTO results VALUE (14, "Walla Walla Community College", 8, 1502.36, 1, 10, "No");
INSERT INTO results VALUE (15, "Blue Mountain Community College", 8, 1502.36, 1, 10, "No");
INSERT INTO results VALUE (16, "Treasure Valley Community College", 8, 1502.36, 1, 10, "No");
INSERT INTO results VALUE (17, "Blue Mountain Community College", 8, 1502.36, 1, 10, "No");
INSERT INTO results VALUE (18, "Treasure Valley Community College", 8, 1502.36, 1, 10, "No");
INSERT INTO results VALUE (19, "Yakima Community College", 8, 1502.36, 1, 10, "No");
INSERT INTO results VALUE (20, "Treasure Valley Community College", 8, 1502.36, 1, 10, "No");
INSERT INTO results VALUE (21, "Blue Mountain Community College", 8, 1502.36, 1, 10, "No");
INSERT INTO results VALUE (22, "Blue Mountain Community College", 8, 1502.36, 1, 10, "No");
INSERT INTO results VALUE (23, "Spokane Community College", 8, 1502.36, 1, 10, "No");
INSERT INTO results VALUE (24, "Blue Mountain Community College", 8, 1502.36, 1, 10, "No");
INSERT INTO results VALUE (25, "Spokane Community College", 8, 1502.36, 1, 10, "No");
INSERT INTO results VALUE (26, "Yakima Community Collegee", 8, 1502.36, 1, 10, "No");
INSERT INTO results VALUE (27, "Blue Mountain Community College", 8, 1502.36, 1, 10, "No");
INSERT INTO results VALUE (28, "Spokane Community College", 8, 1502.36, 1, 10, "No");
INSERT INTO results VALUE (29, "Walla Walla Community College", 8, 1502.36, 1, 10, "No");
INSERT INTO results VALUE (30, "Walla Walla Community College", 8, 1502.36, 1, 10, "No");
INSERT INTO results VALUE (31, "Blue Mountain Community College", 8, 1502.36, 1, 10, "No");


select * from results;