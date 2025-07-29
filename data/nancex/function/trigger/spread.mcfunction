team join player @s
scoreboard players set @s timerTick 0
scoreboard players set @s timerSec 0
clear @s minecraft:cooked_beef
give @s minecraft:cooked_beef[custom_data={shouldClear:1b}] 16

scoreboard players set @s sneakTime 0
scoreboard players set @s jump 0
spreadplayers 1000 0 10 20 under -50 false @s

scoreboard players set @s[tag=MachineGun] energy 45
