insert into man (name1, contact_info, seek_employment, desired_salary) values('cat', 'cat@meow.com', false, 1000);
insert into man (name1, contact_info, seek_employment, desired_salary) values('dog', 'dog@woof.com', true,  1500);
insert into man (name1, contact_info, seek_employment, desired_salary) values('cat&dog', 'catdog@strange.com', true, 500);

insert into skill (name) values ('C');
insert into skill (name) values ('Java');
insert into skill (name) values ('Erlang');

insert into man_skill (man_id, skill_id) values (1, 2);
insert into man_skill (man_id, skill_id) values (1, 3);
insert into man_skill (man_id, skill_id) values (2, 1);
insert into man_skill (man_id, skill_id) values (2, 2);
insert into man_skill (man_id, skill_id) values (3, 1);