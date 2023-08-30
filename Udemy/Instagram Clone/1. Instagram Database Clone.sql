CREATE DATABASE instagram;

CREATE TABLE users(
    id int primary key auto_increment,
    username varchar(255) unique not null,
    createdAt timestamp default now()
);

CREATE TABLE photos(
    id int primary key auto_increment,
    imageUrl varchar(255) not null,
    userId int not null,
    createdAt timestamp default now(),
    foreign key (userId) references users(id)
);

CREATE TABLE tags(
    id int primary key auto_increment,
    tagName varchar(255) unique,
    createdAt timestamp default now()
);

CREATE TABLE photoTags(
    photoId int not null,
    tagId int not null,
    foreign key (photoId) references photos(id),
    foreign key (tagId) references tags(id),
    primary key (photoId, tagId)
);

CREATE TABLE comments(
    id int primary key auto_increment,
    commentText varchar(255) not null,
    userId int not null,
    photoId int not null,
    createdAt timestamp default now(),
    foreign key (userId) references users(id), 
    foreign key (photoId) references photos(id)
);

CREATE TABLE likes(
    userId int not null,
    photoId int not null,
    createdAt timestamp default now(),
    foreign key (userId) references users(id), 
    foreign key (photoId) references photos(id),
    primary key (userId, photoId)
);

CREATE TABLE follows(
    followerId int not null,
    followedId int not null,
    createdAt timestamp default now(),
    foreign key (followerId) references users(id), 
    foreign key (followedId) references users(id), 
    primary key (followerId, followedId)
);