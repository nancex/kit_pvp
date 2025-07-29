# Skill punch dash
execute if score @s[scores={usingItem=1..,cdTick=-2}] usingItem = @s usingItemLast run scoreboard players set @s playerState 1
scoreboard players set @a[scores={playerState=1,playerLastState=0}] cdTick 0
scoreboard players set @a[scores={playerState=1,playerLastState=0}] cdSec 0
scoreboard players set @s[scores={cdSec=2..}] cdTick -1
item replace entity @s[scores={cdTick=0}] container.8 with barrier[custom_name={"bold":true,"color":"red","italic":false,"text":"技能冷却中..."},custom_data={tag:cd1}] 2

scoreboard players remove @s[scores={playerState=1}] usingItem 4
scoreboard players set @s[scores={playerState=1,usingItem=..-1}] usingItem 0
scoreboard players set @s[scores={playerState=0,usingItem=41..}] usingItem 41
scoreboard players set @s[scores={playerState=0,cdTick=0..}] usingItem 0

scoreboard players operation @s[scores={playerState=1,playerLastState=0}] temp = @s usingItem
execute store result score $strength player_motion.api.launch run scoreboard players operation @s[scores={playerState=1,playerLastState=0}] temp *= $const_punch_distance const
execute as @s[scores={playerState=1,playerLastState=0}] at @s facing ~ ~1 ~ run function player_motion:api/launch_looking
scoreboard players set $strength player_motion.api.launch 4000
execute as @s[scores={playerState=1}] at @s rotated ~ 0 run function player_motion:api/launch_looking
# execute as @s[scores={playerState=1},x_rotation=-10..0] at @s run function player_motion:api/launch_looking
# execute as @s[scores={playerState=1},x_rotation=1..90] at @s rotated ~ 0 run function player_motion:api/launch_looking
# execute as @s[scores={playerState=1},x_rotation=-90..-11] at @s rotated ~ -10 run function player_motion:api/launch_looking
execute as @s[scores={playerState=1}] at @s run particle minecraft:lava ~ ~ ~ 0 0 0 1 5

# execute as @s[scores={playerState=1,playerLastState=0}] run scoreboard players operation @s energy = @s usingItem

title @s[scores={playerState=0,usingItem=1..5}] actionbar [{"bold":true,"color":"#FF5500","italic":false,"text":"充能 "},{"bold":true,"color":"dark_gray","italic":false,"text":"▌▌▌▌▌▌▌▌"}]
title @s[scores={playerState=0,usingItem=6..10}] actionbar [{"bold":true,"color":"#FF5500","italic":false,"text":"充能 ▌"},{"bold":true,"color":"dark_gray","italic":false,"text":"▌▌▌▌▌▌▌"}]
title @s[scores={playerState=0,usingItem=11..15}] actionbar [{"bold":true,"color":"#FF5500","italic":false,"text":"充能 ▌▌"},{"bold":true,"color":"dark_gray","italic":false,"text":"▌▌▌▌▌▌"}]
title @s[scores={playerState=0,usingItem=16..20}] actionbar [{"bold":true,"color":"#FF5500","italic":false,"text":"充能 ▌▌▌"},{"bold":true,"color":"dark_gray","italic":false,"text":"▌▌▌▌▌"}]
title @s[scores={playerState=0,usingItem=21..25}] actionbar [{"bold":true,"color":"#FF5500","italic":false,"text":"充能 ▌▌▌▌"},{"bold":true,"color":"dark_gray","italic":false,"text":"▌▌▌▌"}]
title @s[scores={playerState=0,usingItem=26..30}] actionbar [{"bold":true,"color":"#FF5500","italic":false,"text":"充能 ▌▌▌▌▌"},{"bold":true,"color":"dark_gray","italic":false,"text":"▌▌▌"}]
title @s[scores={playerState=0,usingItem=31..35}] actionbar [{"bold":true,"color":"#FF5500","italic":false,"text":"充能 ▌▌▌▌▌▌"},{"bold":true,"color":"dark_gray","italic":false,"text":"▌▌"}]
title @s[scores={playerState=0,usingItem=36..40}] actionbar [{"bold":true,"color":"#FF5500","italic":false,"text":"充能 ▌▌▌▌▌▌▌"},{"bold":true,"color":"dark_gray","italic":false,"text":"▌"}]
title @s[scores={playerState=0,usingItem=41..}] actionbar [{"bold":true,"color":"#FF5500","italic":false,"text":"充能 ▌▌▌▌▌▌▌▌"},{"bold":true,"color":"dark_gray","italic":false,"text":""}]
title @s[scores={playerState=1}] actionbar ""

attribute @s[scores={playerState=0,usingItem=1..}] minecraft:jump_strength base set 0.0
attribute @s[scores={playerState=1,playerLastState=0}] minecraft:jump_strength base reset

execute as @s[scores={playerState=1,playerLastState=0}] store result storage nancex:storage punch_damage int 1 run scoreboard players get @s usingItem
execute at @s[scores={playerState=1}] as @e[distance=0.01..2] run function nancex:util/punch_damage with storage nancex:storage

scoreboard players set @s[scores={playerState=1,playerLastState=1},nbt={OnGround:1b}] playerState 0

# Skill up punch
scoreboard players set @s[scores={sneakTime=1..,jump=1..,playerState=0,cdTick2=-2}] playerState 2
scoreboard players set @a[scores={playerState=2,playerLastState=0}] cdTick2 0
scoreboard players set @a[scores={playerState=2,playerLastState=0}] cdSec2 0
scoreboard players set @s[scores={cdSec2=3..}] cdTick2 -1
item replace entity @s[scores={cdTick2=0}] container.7 with barrier[custom_name={"bold":true,"color":"red","italic":false,"text":"技能冷却中..."},custom_data={tag:cd2}] 3

scoreboard players set $strength player_motion.api.launch 10000
execute as @s[scores={playerState=2,playerLastState=0}] at @s facing ^ ^1 ^ run function player_motion:api/launch_looking

# Skill down punch
scoreboard players set @s[scores={sneakTime=1..,playerState=0,cdTick3=-2},nbt={OnGround:0b}] playerState 3
scoreboard players set @a[scores={playerState=3,playerLastState=0}] cdTick3 0
scoreboard players set @a[scores={playerState=3,playerLastState=0}] cdSec3 0
scoreboard players set @s[scores={cdSec3=3..}] cdTick3 -1
item replace entity @s[scores={cdTick3=0}] container.6 with barrier[custom_name={"bold":true,"color":"red","italic":false,"text":"技能冷却中..."},custom_data={tag:cd3}] 3

scoreboard players set $strength player_motion.api.launch 50000
execute as @s[scores={playerState=3,playerLastState=0}] at @s facing ^ ^-1 ^ run function player_motion:api/launch_looking

# End
scoreboard players operation @s usingItemLast = @s usingItem
scoreboard players set @s[scores={sneakTime=1..}] sneakTime 0
scoreboard players set @s[scores={jump=1..}] jump 0

execute as @a[team=!protected,gamemode=adventure] unless items entity @s hotbar.6 minecraft:barrier unless items entity @s hotbar.6 minecraft:white_stained_glass_pane run item replace entity @s hotbar.6 with white_stained_glass_pane[custom_name={"bold":true,"color":"red","italic":false,"text":"冷却时间槽"}]
