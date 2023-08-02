create table tweets(
id int not null auto_increment,
username varchar(15),
content varchar(140),
favorites int,
primary key(id)
);

insert into tweets (username, content, favorites) values
('feslipebraga', 'hello, this is my first tweet', 876),
('nat_zinho', 'omg i need to work even more this week', 780),
('taylorswift13', 'i hope u enjoy my new version of speak now :)', 572);