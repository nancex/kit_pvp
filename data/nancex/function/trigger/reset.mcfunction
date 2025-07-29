tellraw @s[scores={cdTick=0..}] {"color":"red","text":"部分技能仍在冷却，无法返回大厅！"}
execute if entity @s[scores={cdTick=0..}] run return fail
tellraw @s[scores={cdTick2=0..800}] {"color":"red","text":"部分技能仍在冷却，无法返回大厅！"}
execute if entity @s[scores={cdTick2=0..800}] run return fail
tellraw @s[tag=player_boss] {"color":"red","text":"你是Boss，死亡前无法返回大厅！"}
execute if entity @s[tag=player_boss] run return fail

clear @s *[minecraft:custom_data~{shouldClear:1b}]
team join protected @s
tag @s remove ArmorGuy
tag @s remove Wither
tag @s remove Elf
tag @s remove Thunder
tag @s remove MachineGun

scoreboard players set @s cdTick -2
scoreboard players set @s cdSec -2
scoreboard players set @s cdTick2 -2
scoreboard players set @s cdSec2 -2
scoreboard players set @s cdTick3 -2
scoreboard players set @s cdSec3 -2
scoreboard players set @s timerTick -2
scoreboard players set @s timerSec -2
scoreboard players set @s playerState 0
scoreboard players set @s playerLastState 0
scoreboard players set @s energy 0
scoreboard players set @s canUseItem 1
scoreboard players set @s canUseItem2 1
scoreboard players set @s canUseItem3 1

title @s times 0s 5t 0s

effect clear @s
effect give @s minecraft:regeneration 3 255 true

tp @s 987 -1 -3 180 0
