CREATE TABLE player (
  id serial PRIMARY KEY,
  name VARCHAR(255) NOT null,
  race VARCHAR(255)NOT NULL,
  class VARCHAR(255)NOT NULL,
  guild_id VARCHAR(255),
  guild_title VARCHAR(255),
  level int,
  stats_id int,
  user_id int
);

insert into player (name, race, class) values 
('Eddy_Mashinga', 'Elf', 'Batidor'),
('Mongocho_Perez', 'Elf', 'Warrior'),
('Massacration', 'Gnome', 'Assassin'),
('Bud_Spencer', 'Human', 'Cleric'),
('Kimbo_Slice', 'Orc', 'Barbarian'),
('Terence_hill', 'Elf', 'Ranger'),
('Larry_Cañonga', 'Orc', 'Necromancer'),
('Elmo_rocho', 'Orc', 'Thief');

select * from player;



CREATE TABLE guild (
  id serial PRIMARY KEY,
  name VARCHAR(255) NOT null,
  guild_title VARCHAR(255),
  level int,
  member int
);


insert into guild (name, guild_title) values 
('Destroyers_Copper', 'Brood_killers'),
('Destroyers_Silver', 'Hero_Killers'),
('Destroyers_Gold', 'God_Killers');


select * from guild;

-- Destroyer Gold 4 members (Eddy, Mongo, Massa and Bud)
-- Destroyer Silver 2 members (Larry and Kimbo)
-- Destroyer Copper 2 members (Terence and Elmo)

alter table player add constraint fk_id_guild foreign key (guild_id) references guild(id);



SELECT * FROM player
CREATE OR REPLACE procedure Upgrade_G (
  player_id  int
)
LANGUAGE plpgsql
AS $$
BEGIN
  -- Update Subir al player al guild de su nivel
  UPDATE player
  SET guild_id = 2
  WHERE id = player_id;
  
  commit;
end$$;

CALL Upgrade_G(5);
