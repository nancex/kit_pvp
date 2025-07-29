# Hoe
execute if score @s usingItem = @s usingItemLast run scoreboard players set @s usingItem 0
execute at @s[scores={usingItem=1..}] run particle minecraft:enchant ~-0.5 ~ ~-0.5 1.5 1 1.5 0.1 20 force @a
execute at @s[scores={usingItem=1}] run playsound minecraft:block.portal.ambient master @a ~ ~ ~ 1 1.2 0.3
execute at @s[scores={usingItem=75}] run playsound minecraft:block.portal.ambient master @a ~ ~ ~ 1 1.2 0.3
execute at @s[scores={usingItem=150}] run playsound minecraft:block.portal.ambient master @a ~ ~ ~ 1 1.2 0.3
execute at @s[scores={usingItem=0,usingItemLast=1..}] run stopsound @a[distance=0..15] master minecraft:block.portal.ambient
execute at @s[scores={usingItem=1..}] run particle minecraft:dust{color:[0.129,0.973,1.000],scale:1} ~-0.5 ~ ~-0.5 1.5 1 1.5 0.1 5 force @a

execute as @s[scores={usingItem=1..}] run scoreboard players operation @s usingItemPer2T = @s usingItem
execute as @s[scores={usingItem=1..}] run scoreboard players operation @s usingItemPer2T %= const_2 const
scoreboard players add @s[scores={usingItem=1..,usingItemPer2T=0,energy=..99}] energy 1
title @s actionbar [{"bold":true,"color":"blue","italic":false,"text":"雷之法力: "},{"score":{"name":"@s","objective":"energy"}},{"bold":true,"color":"blue","italic":false,"text":" / 100"}]

scoreboard players add @s[scores={timerPerSec=1,usingItem=0,energy=..99}] energy 1

# Skill 1
scoreboard players set @s[scores={cdTick=15..}] cdTick -1
scoreboard players set @s[scores={cdTick=8..,cdTick2=0..200}] cdTick -1
item replace entity @s[scores={cdTick=0}] container.8 with barrier[custom_name={"bold":true,"color":"red","italic":false,"text":"技能冷却中..."},custom_data={tag:cd1}] 1

scoreboard players remove @s[scores={cdTick=0,energy=10..,cdTick2=-2}] energy 10
scoreboard players remove @s[scores={cdTick=0,energy=10..,cdTick2=200..}] energy 10

execute at @s[scores={cdTick=0}] run summon marker ~ ~ ~ {Tags:["thunder_raycast"],NoGravity:1b}
execute as @e[tag=thunder_raycast] at @s unless score @s ID = @s ID run scoreboard players operation @s ID = @p ID
execute as @s[scores={cdTick=0}] at @s run tp @n[type=minecraft:marker] @s
execute as @s[scores={cdTick=0}] at @s run tp @n[type=minecraft:marker] ~ ~1.62 ~
execute as @e[tag=thunder_raycast] at @s positioned ^ ^ ^0.9 run tp @s ~ ~ ~
execute as @e[tag=thunder_raycast] at @s run particle minecraft:dust{color:[0.129,0.973,1.000],scale:1} ~ ~ ~ 0 0 0 0.1 3 force @a
execute at @s[scores={cdTick2=0..200}] as @e[tag=thunder_raycast,distance=0..20] at @s positioned ^ ^ ^0.45 run tp @s ~ ~ ~
execute as @e[tag=thunder_raycast] at @s run particle minecraft:dust{color:[0.129,0.973,1.000],scale:1} ~ ~ ~ 0 0 0 0.1 3 force @a

execute as @e[tag=thunder_raycast] at @s unless block ~ ~ ~ air unless block ~ ~ ~ short_grass unless block ~ ~ ~ #c:flowers run tag @s add thunder_raycast_done
execute at @e[tag=thunder_raycast_done] as @e[distance=0..1.75,type=!marker] run execute as @a[tag=Thunder] if score @s ID = @n[tag=thunder_raycast_done] ID run damage @n[type=!marker] 6 minecraft:generic_kill by @s
execute at @e[tag=thunder_raycast_done] run summon minecraft:lightning_bolt ~ ~ ~

execute as @e[tag=thunder_raycast] at @s unless entity @a[tag=Thunder,distance=0..30] run kill @s
kill @e[tag=thunder_raycast_done]

# Skill 2
execute as @s[scores={useItem=2,energy=..99,cdTick2=-2}] run tellraw @s {"color":"red","text":"你需要100法力来释放这个技能！"}
execute as @s[scores={useItem=2,energy=..99,cdTick2=-2}] at @s run playsound minecraft:block.note_block.basedrum master @s ~ ~ ~ 1 0.5 1

scoreboard players set @s[scores={cdSec2=30..}] cdTick2 -1
item replace entity @s[scores={cdTick2=0}] container.7 with barrier[custom_name={"bold":true,"color":"red","italic":false,"text":"技能冷却中..."},custom_data={tag:cd2}] 30

scoreboard players remove @s[scores={cdTick2=0}] energy 100

effect give @s[scores={cdTick2=0}] minecraft:levitation 1 2 true
effect give @s[scores={cdSec2=1}] minecraft:levitation 9 0 true
effect give @s[scores={cdSec2=10}] minecraft:slow_falling 3 0 true
effect give @s[scores={cdSec2=12}] minecraft:blindness 4 0 true

effect give @s[scores={cdTick2=0}] minecraft:regeneration 10 3 true
effect give @s[scores={cdTick2=0}] minecraft:resistance 10 3 true

execute at @s[scores={cdTick2=0}] run playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 1 1 1

execute at @s[scores={cdPerSec2=0,cdSec2=..9}] run function nancex:util/thunder_spread

# End
scoreboard players operation @s usingItemLast = @s usingItem
scoreboard players set @s[scores={canUseItem=1,energy=..10,cdTick2=-2}] canUseItem 0
scoreboard players set @s[scores={canUseItem=1,energy=..10,cdTick2=200..}] canUseItem 0
scoreboard players set @s[scores={canUseItem=0,energy=10..}] canUseItem 1

scoreboard players set @s[scores={canUseItem2=1,energy=..99}] canUseItem2 0
scoreboard players set @s[scores={canUseItem2=0,energy=100}] canUseItem2 1
