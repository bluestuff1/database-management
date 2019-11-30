USE test;

ALTER TABLE Student
ADD gender CHAR(6)
CHECK(gender = 'Male' OR gender = 'Female');

ALTER TABLE Subj_Enrolment
DROP COLUMN comment;