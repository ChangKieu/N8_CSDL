create table department
	(dept_name		varchar(50), 
	 building		varchar(5), 
	 budget		numeric(12,2) check (budget > 0),
	 primary key (dept_name)
	);

create table instructor
	(ID			varchar(6), 
	 name			varchar(30) not null, 
	 dept_name		varchar(50), 
	 salary			numeric(8,2) check (salary > 0),
	 primary key (ID),
	 foreign key (dept_name) references department (dept_name)
		on delete set null
	);
	
create table student
	(ID			varchar(11), 
	 name			varchar(30) not null, 
	 dept_name		varchar(50), 
	 tot_cred		numeric(3,0) check (tot_cred >= 0),
	 primary key (ID),
	 foreign key (dept_name) references department (dept_name)
		on delete set null
	);

create table course
	(course_id		varchar(8), 
	 title			varchar(50), 
	 dept_name		varchar(50),
	 credits		numeric(2,0) check (credits > 0),
	 primary key (course_id),
	 foreign key (dept_name) references department (dept_name)
		on delete set null
	);
	
create table classroom
	(building		varchar(5),
	 room_number	varchar(5),
	 capacity		numeric(3,0),
	 primary key (building, room_number)
	);

create table time_slot
	(time_slot_id	varchar(4),
	 day			varchar(1),
	 start_hr		numeric(2) check (start_hr >= 0 and start_hr < 24),
	 start_min		numeric(2) check (start_min >= 0 and start_min < 60),
	 end_hr		numeric(2) check (end_hr >= 0 and end_hr < 24),
	 end_min		numeric(2) check (end_min >= 0 and end_min < 60),
	 primary key (time_slot_id)
	);



create table class 
	(course_id		varchar(8), 
     class_id			varchar(8),
	 semester		varchar(6)
	 check (semester in ('Fall', 'Winter', 'Spring', 'Summer')), 
	 year			numeric(4,0) check (year > 1952 and year < 2100), 
	 building		varchar(5),
	 room_number	varchar(5),
	 time_slot_id	varchar(4),
	 primary key (course_id, class_id, semester, year),
	 foreign key (course_id) references course (course_id)
		on delete cascade,
	 foreign key (building, room_number) references classroom (building, room_number)
		on delete set null,
	 foreign key (time_slot_id) references time_slot (time_slot_id)
		on delete set null
	);
	
create table teaches
	(ID			varchar(5), 
	 course_id		varchar(8),
	 class_id		varchar(8), 
	 semester		varchar(6),
	 year			numeric(4,0),
	 primary key (ID, course_id, class_id, semester, year),
	 foreign key (course_id, class_id, semester, year) references class (course_id, class_id, semester, year)
		on delete cascade,
	 foreign key (ID) references instructor (ID)
		on delete cascade
	);
	
create table takes
	(ID			varchar(11), 
	 course_id		varchar(8),
	 class_id		varchar(8), 
	 semester		varchar(6),
	 year			numeric(4,0),
	 grade		    numeric(2,1),
	 primary key (ID, course_id, class_id, semester, year),
	 foreign key (course_id, class_id, semester, year) references class (course_id, class_id, semester, year)
		on delete cascade,
	 foreign key (ID) references student (ID)
		on delete cascade
	);

create table advisor
	(s_ID			varchar(11),
	 i_ID			varchar(5),
	 primary key (s_ID),
	 foreign key (i_ID) references instructor (ID)
		on delete set null,
	 foreign key (s_ID) references student (ID)
		on delete cascade
	);
