# Skill punch dash
execute if score @s[scores={usingItem=1..,cdTick=-2}] usingItem = @s usingItemLast run scoreboard players set @s playerState 1
scoreboard players set @s[scores={playerState=1,playerLastState=0}] cdTick 0
scoreboard players set @s[scores={playerState=1,playerLastState=0}] cdSec 0
scoreboard players set @s[scores={cdSec=2..}] cdTick -1
item replace entity @s[scores={cdTick=0}] container.8 with barrier[custom_name={"bold":true,"color":"red","italic":false,"text":"技能冷却中..."},custom_data={tag:cd1}] 2

execute if items entity @s[scores={cdTick=0}] weapon minecraft:diamond_hoe run item modify entity @s weapon {function:"minecraft:set_components",components:{"!minecraft:consumable":{}},conditions:[]}
execute if items entity @s[scores={cdTick=-2}] weapon minecraft:diamond_hoe run item modify entity @s weapon {function:"minecraft:set_components",components:{"minecraft:consumable":{consume_seconds:999999,animation:"bow",has_consume_particles:false}},conditions:[]}

scoreboard players remove @s[scores={playerState=1}] usingItem 4
scoreboard players set @s[scores={playerState=1,usingItem=..-1}] usingItem 0
scoreboard players set @s[scores={playerState=0,usingItem=41..}] usingItem 41
scoreboard players set @s[scores={playerState=0,cdTick=0..}] usingItem 0
scoreboard players remove @s[scores={playerState=0},nbt={OnGround:0b},usingItem=1..] usingItem 1

execute at @s[scores={playerState=0,usingItem=1}] run playsound minecraft:item.crossbow.quick_charge_1 master @a ~ ~ ~ 1 1 0
execute at @s[scores={cdTick=0}] run playsound minecraft:entity.blaze.shoot master @a ~ ~ ~ 1 1 0

scoreboard players operation @s[scores={playerState=1,playerLastState=0}] temp = @s usingItem
execute store result score $strength player_motion.api.launch run scoreboard players operation @s[scores={playerState=1,playerLastState=0}] temp *= $const_punch_distance const
execute as @s[scores={playerState=1,playerLastState=0}] at @s facing ~ ~1 ~ run function player_motion:api/launch_looking
scoreboard players set $strength player_motion.api.launch 4000
execute as @s[scores={playerState=1}] at @s rotated ~ 0 run function player_motion:api/launch_looking
execute as @s[scores={playerState=1}] at @s run particle minecraft:lava ~ ~ ~ 0 0 0 1 5

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

execute as @s[scores={playerState=1,playerLastState=0}] store result storage nancex:storage punch_damage float 0.5 run scoreboard players get @s usingItem
execute at @s[scores={playerState=1}] as @e[distance=0.01..2] run function nancex:util/punch_damage with storage nancex:storage

scoreboard players set @s[scores={playerState=1,playerLastState=1},nbt={OnGround:1b}] playerState 0

# Skill punch up
scoreboard players set @s[scores={sneakTime=1..,jump=1..,playerState=0,cdTick2=-2}] playerState 2
scoreboard players set @s[scores={playerState=2,playerLastState=0}] cdTick2 0
scoreboard players set @s[scores={playerState=2,playerLastState=0}] cdSec2 0
scoreboard players set @s[scores={cdSec2=4..}] cdTick2 -1
item replace entity @s[scores={cdTick2=0}] container.7 with barrier[custom_name={"bold":true,"color":"red","italic":false,"text":"技能冷却中..."},custom_data={tag:cd2}] 4

scoreboard players set $strength player_motion.api.launch 10000
execute as @s[scores={cdTick2=0}] at @s facing ~ ~1 ~ run function player_motion:api/launch_looking

execute at @s[scores={cdTick2=0}] run playsound minecraft:entity.ender_dragon.flap master @a ~ ~ ~ 1 1.25 0
execute at @s[scores={cdTick2=0..10}] run particle minecraft:flame ~ ~ ~ 0 0 0 0.05 10 force

execute at @s[scores={cdTick2=0}] rotated ~ 0 positioned ^ ^ ^2 at @e[distance=..1.99] run damage @n 4 generic by @s
execute at @s[scores={cdTick2=0}] rotated ~ 0 positioned ^ ^ ^2 at @e[distance=..1.99] run damage @n 4 generic by @s

# Skill punch down
execute at @s[scores={sneakTime=1..,playerState=0,cdTick3=-2},nbt={OnGround:0b}] if block ~ ~-1 ~ air if block ~ ~-2 ~ air run scoreboard players set @s playerState 3
scoreboard players set @s[scores={playerState=3,playerLastState=0}] cdTick3 0
scoreboard players set @s[scores={playerState=3,playerLastState=0}] cdSec3 0
scoreboard players set @s[scores={cdSec3=4..}] cdTick3 -1
item replace entity @s[scores={cdTick3=0}] container.6 with barrier[custom_name={"bold":true,"color":"red","italic":false,"text":"技能冷却中..."},custom_data={tag:cd3}] 4

attribute @s[scores={cdTick3=0}] minecraft:gravity base set 0.035

scoreboard players set $strength player_motion.api.launch 2500
execute as @s[scores={playerState=3},x_rotation=-90..29] at @s rotated ~ 30 run function player_motion:api/launch_looking
execute as @s[scores={playerState=3},x_rotation=30..90] at @s rotated ~ ~ run function player_motion:api/launch_looking

scoreboard players set @s[scores={cdTick3=0}] temp 0
scoreboard players add @s[scores={playerState=3}] temp 1
title @s[scores={playerState=3}] actionbar [{"bold":true,"color":"#FF5500","italic":false,"text":"裂地重锤伤害: "},{"score":{"name":"@s","objective":"temp"}}]
execute as @s[scores={playerState=3},nbt={OnGround:1b}] store result storage nancex:storage punch_damage2 int 1 run scoreboard players get @s temp
execute at @s[scores={playerState=3},nbt={OnGround:1b}] as @e[distance=0.01..2.5] if predicate {condition:"minecraft:entity_properties",entity:"this",predicate:{distance:{y:{min:0,max:1.5},horizontal:{min:0,max:2.5}}}} run function nancex:util/punch_damage2 with storage nancex:storage

scoreboard players set @s[scores={playerState=2,sneakTime=0}] playerState 0
scoreboard players set @s[scores={playerState=3},nbt={OnGround:1b}] playerState 0

execute at @s[scores={playerState=0,playerLastState=3}] run playsound minecraft:block.anvil.place master @a ~ ~ ~ 0.6 1 0
execute at @s[scores={playerState=0,playerLastState=3}] run particle minecraft:explosion ~ ~ ~ 1.5 1 1.5 0.05 10 force
attribute @s[scores={playerState=0,playerLastState=3}] minecraft:gravity base reset

# Passive
scoreboard players set @s[scores={playerState=0,playerLastState=1..3}] damageDealt 1000
execute if items entity @s[scores={playerState=0,playerLastState=1..3}] weapon minecraft:diamond_hoe run item modify entity @s weapon {function:"minecraft:set_components",components:{"enchantments":{"minecraft:knockback":1,"minecraft:fire_aspect":1},"attribute_modifiers":[{id:"attack_damage",type:"attack_damage",amount:5,operation:"add_value"},{id:"entity_interaction_range",type:"entity_interaction_range",amount:2.5,operation:"add_value"}],"item_model":"raw_gold"},conditions:[]}
scoreboard players operation @s[scores={playerState=0,playerLastState=1..3}] timerTemp = @s timerTick
scoreboard players add @s[scores={playerState=0,playerLastState=1..3}] timerTemp 30
execute if items entity @s[scores={damageDealt=1001..}] weapon minecraft:diamond_hoe run item modify entity @s weapon {function:"minecraft:set_components",components:{"attribute_modifiers":[{id:"attack_damage",type:"attack_damage",amount:1,operation:"add_value"}],"!enchantments":{},"item_model":"resin_clump"},conditions:[]}
scoreboard players set @s[scores={damageDealt=1001..}] damageDealt 0

execute if score @s timerTemp < @s timerTick if items entity @s weapon minecraft:diamond_hoe run item modify entity @s weapon {function:"minecraft:set_components",components:{"attribute_modifiers":[{id:"attack_damage",type:"attack_damage",amount:1,operation:"add_value"}],"!enchantments":{},"item_model":"resin_clump"},conditions:[]}

# End
scoreboard players operation @s usingItemLast = @s usingItem
scoreboard players set @s[scores={sneakTime=1..}] sneakTime 0
scoreboard players set @s[scores={jump=1..}] jump 0

execute as @s[team=!protected,gamemode=adventure] unless items entity @s hotbar.6 minecraft:barrier unless items entity @s hotbar.6 minecraft:white_stained_glass_pane run item replace entity @s hotbar.6 with white_stained_glass_pane[custom_name={"bold":true,"color":"red","italic":false,"text":"冷却时间槽"}]
