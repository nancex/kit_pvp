tellraw @a[name=Nancex] [{"bold":true,"color":"white","italic":false,"text":"[KitPVP] "},{"bold":false,"color":"green","italic":false,"text":"datapack loaded !"}]

scoreboard players set $const_punch_distance const 140
scoreboard players set $const_20 const 20
scoreboard players set $const_4 const 4
scoreboard players set $const_3 const 3
scoreboard players set $const_2 const 2
scoreboard players set $const_1 const 1
scoreboard players set $const_0 const 0

execute unless score _current_event serverStatus = _current_event serverStatus run scoreboard players set _current_event serverStatus 0
execute unless score _cd_tick_per_sec serverStatus = _cd_tick_per_sec serverStatus run scoreboard players set _cd_tick_per_sec serverStatus -1

scoreboard players enable Nancex trigger

data modify storage nancex:storage punch_damage set value 20
