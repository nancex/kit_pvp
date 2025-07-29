# execute if score @s usingItem matches 1.. if score @s usingItem = @s usingItemLast run clear @s diamond_hoe
execute if score @s usingItem matches 1.. if score @s usingItem = @s usingItemLast run scoreboard players set @s playerState 1

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

# End
scoreboard players operation @s usingItemLast = @s usingItem
