# execute if score @s usingItem matches 1.. if score @s usingItem = @s usingItemLast run clear @s diamond_hoe

execute if score @s[scores={usingItem=1..,cdTick=-2}] usingItem = @s usingItemLast run scoreboard players set @s playerState 1
scoreboard players set @a[scores={playerState=1,playerLastState=0}] cdTick 0
scoreboard players set @a[scores={playerState=1,playerLastState=0}] cdSec 0
scoreboard players set @s[scores={cdSec=5..}] cdTick -1
item replace entity @s[scores={cdTick=0}] container.8 with barrier[custom_name={"bold":true,"color":"red","italic":false,"text":"技能冷却中..."},custom_data={tag:cd1}] 5

scoreboard players remove @s[scores={playerState=1}] usingItem 1
scoreboard players set @s[scores={playerState=0,usingItem=41..}] usingItem 41

scoreboard players set $strength player_motion.api.launch 5000
execute as @s[scores={playerState=1,playerLastState=0}] at @s facing ^ ^10 ^1 run function player_motion:api/launch_looking
scoreboard players set $strength player_motion.api.launch 2000
execute as @s[scores={playerState=1},x_rotation=-20..20] at @s run function player_motion:api/launch_looking
execute as @s[scores={playerState=1},x_rotation=21..90] at @s rotated ~ 20 run function player_motion:api/launch_looking
execute as @s[scores={playerState=1},x_rotation=-90..-21] at @s rotated ~ -20 run function player_motion:api/launch_looking
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


execute as @s[scores={playerState=1,playerLastState=0}] store result storage nancex:storage punch_damage int 1 run scoreboard players get @s usingItem
execute at @s[scores={playerState=1}] as @e[distance=0.01..1.5] run function nancex:util/punch_damage with storage nancex:storage

execute as @s[scores={playerState=1,playerLastState=1,usingItem=10..},nbt={OnGround:1b},tag=!punch_on_ground] run scoreboard players set @s usingItem 5
execute as @s[scores={playerState=1,playerLastState=1,usingItem=10..},nbt={OnGround:1b},tag=!punch_on_ground] run tag @s add punch_on_ground
execute at @s[scores={playerState=1}] if entity @e[distance=0.01..1.5] run scoreboard players set @n playerState 0

scoreboard players set @s[scores={playerState=1,usingItem=..0}] playerState 0

tag @s[scores={playerState=0,playerLastState=1}] remove punch_on_ground

# Skill up punch
scoreboard players set @s[scores={sneakTime=1..,jump=1..,playerState=0,cdTick2=-2}] playerState 2
scoreboard players set @a[scores={playerState=2,playerLastState=0}] cdTick2 0
scoreboard players set @a[scores={playerState=2,playerLastState=0}] cdSec2 0
scoreboard players set @s[scores={cdSec2=5..}] cdTick2 -1
item replace entity @s[scores={cdTick2=0}] container.7 with barrier[custom_name={"bold":true,"color":"red","italic":false,"text":"技能冷却中..."},custom_data={tag:cd1}] 5

scoreboard players set $strength player_motion.api.launch 50000
execute as @s[scores={playerState=2,playerLastState=0}] at @s facing ^ ^1 ^ run function player_motion:api/launch_looking

# Skill down punch
scoreboard players set @s[scores={sneakTime=1..,playerState=0,cdTick3=-2},nbt={OnGround:0b}] playerState 3
scoreboard players set @a[scores={playerState=3,playerLastState=0}] cdTick3 0
scoreboard players set @a[scores={playerState=3,playerLastState=0}] cdSec3 0
scoreboard players set @s[scores={cdSec3=5..}] cdTick3 -1
item replace entity @s[scores={cdTick3=0}] container.8 with barrier[custom_name={"bold":true,"color":"red","italic":false,"text":"技能冷却中..."},custom_data={tag:cd1}] 5

scoreboard players set $strength player_motion.api.launch 50000
execute as @s[scores={playerState=3,playerLastState=0}] at @s facing ^ ^-1 ^ run function player_motion:api/launch_looking

# End
scoreboard players operation @s usingItemLast = @s usingItem
scoreboard players set @s[scores={sneakTime=1..}] sneakTime 0
scoreboard players set @s[scores={jump=1..}] jump 0

execute as @a[team=!protected,gamemode=adventure] unless items entity @s hotbar.6 minecraft:barrier unless items entity @s hotbar.6 minecraft:white_stained_glass_pane run item replace entity @s hotbar.6 with white_stained_glass_pane[custom_name={"bold":true,"color":"red","italic":false,"text":"冷却时间槽"}]
