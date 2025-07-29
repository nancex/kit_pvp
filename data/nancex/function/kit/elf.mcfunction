scoreboard players set @s[scores={cdSec=7..}] cdTick -1
item replace entity @s[scores={cdTick=0}] container.8 with barrier[custom_name={"bold":true,"color":"red","italic":false,"text":"技能冷却中..."},custom_data={tag:cd1}] 7

give @s[scores={cdTick=0}] crossbow[charged_projectiles=[{id:"minecraft:arrow",count:1,components:{"minecraft:intangible_projectile":{}}}],custom_name={"bold":true,"color":"gold","italic":false,"text":"自然之力"},enchantments={"minecraft:power":7,"minecraft:punch":2},damage=465,custom_data={shouldClear:1b}] 1
clear @s[scores={cdTick=-1}] minecraft:crossbow
scoreboard players set @s[nbt={OnGround:1b},scores={playerState=1}] playerState 0
scoreboard players set @s[scores={sneakTime=1..,jump=1..,energy=60..}] playerState 1
scoreboard players set @s[scores={playerState=1,playerLastState=0}] energy 0
scoreboard players add @s[scores={energy=..59,timerPer2T=0,playerState=0}] energy 1

title @s[scores={energy=..9}] actionbar [{"bold":true,"color":"dark_green","italic":false,"text":"轻盈一跃 "},{"bold":true,"color":"dark_gray","italic":false,"text":"██████"}]
title @s[scores={energy=10..19}] actionbar [{"bold":true,"color":"dark_green","italic":false,"text":"轻盈一跃 █"},{"bold":true,"color":"dark_gray","italic":false,"text":"█████"}]
title @s[scores={energy=20..29}] actionbar [{"bold":true,"color":"dark_green","italic":false,"text":"轻盈一跃 ██"},{"bold":true,"color":"dark_gray","italic":false,"text":"████"}]
title @s[scores={energy=30..39}] actionbar [{"bold":true,"color":"dark_green","italic":false,"text":"轻盈一跃 ███"},{"bold":true,"color":"dark_gray","italic":false,"text":"███"}]
title @s[scores={energy=40..49}] actionbar [{"bold":true,"color":"dark_green","italic":false,"text":"轻盈一跃 ████"},{"bold":true,"color":"dark_gray","italic":false,"text":"██"}]
title @s[scores={energy=50..59}] actionbar [{"bold":true,"color":"dark_green","italic":false,"text":"轻盈一跃 █████"},{"bold":true,"color":"dark_gray","italic":false,"text":"█"}]
title @s[scores={energy=60..}] actionbar [{"bold":true,"color":"dark_green","italic":false,"text":"轻盈一跃 "},{"bold":true,"color":"gold","italic":false,"text":"██████"}]

execute at @s[scores={energy=60..}] run particle dust{color:[0.0,1.0,0.0],scale:2} ~ ~ ~ 0.225 0 0.225 0.01 4 force @a
effect give @s[scores={sneakTime=1..,energy=60..}] minecraft:jump_boost 1 8 true
execute at @s[scores={energy=60}] run playsound entity.experience_orb.pickup master @p
scoreboard players add @s[scores={energy=60}] energy 1
execute at @s[scores={playerState=1,playerLastState=0}] run playsound minecraft:entity.ender_dragon.flap master @a ~ ~ ~ 1 1.5
execute at @s[scores={playerState=1,playerLastState=0}] run particle minecraft:cloud ~ ~0.5 ~ 0 0 0 0.2 80 force
effect give @s[scores={playerState=1,playerLastState=0}] minecraft:slow_falling 3 0 true
effect clear @s[scores={sneakTime=0,playerState=0}] minecraft:jump_boost

scoreboard players set @s[scores={sneakTime=1..}] sneakTime 0
scoreboard players set @s[scores={jump=1..}] jump 0
