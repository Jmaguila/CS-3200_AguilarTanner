CREATE DATABASE IF NOT EXISTS FINAL;
USE FINAL;

-- a client does not have to be player
Create Table client(
    username varchar(64) primary key not null,
    password varchar(64) not null
    );

Create Table player(
    player_id int primary key,
    username varchar(64) not null,
    team_name varchar(64),
	foreign key (team_name) references team(team_name) on update cascade on delete set null
    );

Create Table hero(
    hero_id int primary key, 
    name varchar(64) not null, 
    attack_type varchar(64),
    lore text
    );

Create Table player_stats(
    player_id int primary key,
    foreign key (player_id) references player(player_id) on update cascade on delete cascade,
    mmr int not null,
    wins int,
    losses int, 
    most_played_hero int,
    foreign key (most_played_hero) references hero(hero_id) on update cascade on delete set null
    );

Create Table team(
    team_name varchar(64) primary key,
    captain int,
    foreign key (captain) references player(player_id) on update cascade on delete cascade,
    avg_mmr int
    );

Create table abilities(
    name varchar(64) primary key,
    hero_id int,
    foreign key (hero_id) references hero(hero_id) on update cascade on delete cascade,
    description text
    );

Create table hero_stats(
    hero_id int primary key, 
    foreign key (hero_id) references hero(hero_id) on update cascade on delete cascade,
    strength int, 
    agility int, 
    intelegence int, 
    movement_speed int, 
    damage int, 
    armor int
    );