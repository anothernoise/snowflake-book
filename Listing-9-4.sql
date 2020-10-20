#Listing 9.4

create or replace table dic_zip_neighborhoods 
	(zip_code string(5), 
	 name string(35)
	);

insert into dic_zip_neighborhoods values
('10001','Chelsea and Clinton'),
('10002','Lower East Side'), 
('10003','Lower East Side'), 
('10004','Lower Manhattan') 
;


create view stats_by_zip_with_neighborhoods AS 
select s.Jurisdiction_Name,
	d.name as Neighborhoods, 
	s.Count_Participants, 
	s.Count_Female, 
	s.Count_Male
from stats_by_zip as s
left outer join dic_zip_neighborhoods as d
on trim(s.Jurisdiction_Name::string) = d.zip_code 
;

select * from stats_by_zip_with_neighborhoods;