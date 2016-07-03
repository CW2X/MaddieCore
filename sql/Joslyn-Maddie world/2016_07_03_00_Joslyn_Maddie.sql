-- Fix waypoints for Recruitment Officer Carven event.
-- Recruits stood on the table..

DELETE FROM `waypoints` WHERE `entry`=25220;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(25220, 1, 2253.644, 5195.469, 11.40062, 'Civilian Recruit'),
(25220, 2, 2254.098, 5196.36, 11.40062, 'Civilian Recruit'),
(25220, 3, 2277.823, 5238.724, 11.45096, 'Civilian Recruit'),
(25220, 4, 2279.217, 5241.407, 11.45096, 'Civilian Recruit'),
(25220, 5, 2280.84, 5244.218, 11.45719, 'Civilian Recruit'),
(25220, 6, 2282.603, 5245.736, 11.36353, 'Civilian Recruit'),
(25220, 7, 2284.867, 5246.299, 11.45096, 'Civilian Recruit'),
(25220, 8, 2287.469, 5245.929, 11.45096, 'Civilian Recruit'),
(25220, 9, 2289.469, 5244.898, 11.45096, 'Civilian Recruit'),
(25220, 10, 2291.772, 5243.933, 11.45096, 'Civilian Recruit'),
(25220, 11, 2294.129, 5242.708, 11.45096, 'Civilian Recruit'),
(25220, 12, 2296.452, 5241.821, 11.399 , 'Civilian Recruit'),
(25220, 13, 2303.019, 5253.306, 11.50584, 'Civilian Recruit'),
(25220, 14, 2308.73, 5256.926, 11.50584, 'Civilian Recruit'),
(25220, 15, 2320.826, 5259.258, 11.25584, 'Civilian Recruit');
