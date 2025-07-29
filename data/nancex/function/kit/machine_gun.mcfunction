# Hoe
execute if score @s usingItem = @s usingItemLast run scoreboard players set @s usingItem 0

execute as @s[scores={usingItem=1..}] run scoreboard players operation @s usingItemPer3T = @s usingItem
execute as @s[scores={usingItem=1..}] run scoreboard players operation @s usingItemPer3T %= const_3 const

# Shoot
scoreboard players remove @s[scores={usingItem=1..,usingItemPer3T=0,energy=1..,playerState=0}] energy 1
execute at @s[scores={usingItem=1..,usingItemPer3T=0,energy=1..,playerState=0}] run playsound minecraft:block.creaking_heart.break master @a ~ ~ ~ 1 0.6 0
execute at @s[scores={usingItem=1..,usingItemPer3T=0,energy=..0,playerState=0}] run playsound minecraft:block.dispenser.dispense master @a ~ ~ ~ 1 1.5 0

execute at @s[scores={usingItem=1..,usingItemPer3T=0,energy=1..,playerState=0}] run summon marker ~ ~ ~ {Tags:["machine_gun_bullet"],NoGravity:1b}
execute as @e[tag=machine_gun_bullet] at @s unless score @s ID = @s ID run scoreboard players operation @s ID = @p ID

execute as @s[scores={usingItem=1..,usingItemPer3T=0,energy=1..,playerState=0}] at @s run tp @n[type=minecraft:marker] @s
execute as @s[scores={usingItem=1..,usingItemPer3T=0,energy=1..,playerState=0}] at @s run tp @n[type=minecraft:marker] ~ ~1.62 ~

# Shot
execute as @e[tag=machine_gun_bullet] at @s positioned ^ ^ ^0.4 run tp @s ~ ~ ~
function nancex:util/machine_gun_bullet_check
execute as @e[tag=machine_gun_bullet] at @s positioned ^ ^ ^0.4 run tp @s ~ ~ ~
function nancex:util/machine_gun_bullet_check
execute as @e[tag=machine_gun_bullet] at @s run particle minecraft:dust{color:[1.0,1.0,1.0],scale:0.4} ~ ~ ~ 0 0 0 0.1 3 force @a
execute at @s as @e[tag=machine_gun_bullet] if score @s[distance=20..] ID = @p ID run kill @s


execute as @s[scores={playerState=0}] run title @s actionbar [{"bold":true,"color":"white","italic":false,"text":"弹匣: "},{"score":{"name":"@s","objective":"energy"}},{"bold":true,"color":"white","italic":false,"text":" / 45"}]

# Skill 1
scoreboard players set @s[scores={cdSec=5..}] cdTick -1
item replace entity @s[scores={cdTick=0}] container.8 with barrier[custom_name={"bold":true,"color":"red","italic":false,"text":"技能冷却中..."},custom_data={tag:cd1}] 5

scoreboard players set @s[scores={cdTick=0}] playerState 1
execute as @s[scores={playerState=1,cdTick=0}] run title @s actionbar [{"bold":true,"color":"white","italic":false,"text":"正在换弹 "},{"bold":true,"color":"dark_gray","italic":false,"text":"████"}]
execute as @s[scores={playerState=1,cdTick=15}] run title @s actionbar [{"bold":true,"color":"white","italic":false,"text":"正在换弹 █"},{"bold":true,"color":"dark_gray","italic":false,"text":"███"}]
execute as @s[scores={playerState=1,cdTick=30}] run title @s actionbar [{"bold":true,"color":"white","italic":false,"text":"正在换弹 ██"},{"bold":true,"color":"dark_gray","italic":false,"text":"██"}]
execute as @s[scores={playerState=1,cdTick=45}] run title @s actionbar [{"bold":true,"color":"white","italic":false,"text":"正在换弹 ███"},{"bold":true,"color":"dark_gray","italic":false,"text":"█"}]
execute as @s[scores={playerState=1,cdTick=60}] run title @s actionbar [{"bold":true,"color":"white","italic":false,"text":"正在换弹 ████"}]

execute at @s[scores={playerState=1,cdTick=15}] run playsound minecraft:block.iron_trapdoor.open master @a ~ ~ ~ 1 1 0
execute at @s[scores={playerState=1,cdTick=25}] run playsound minecraft:entity.shulker.open master @a ~ ~ ~ 1 1.5 0
execute at @s[scores={playerState=1,cdTick=45}] run playsound minecraft:block.iron_trapdoor.close master @a ~ ~ ~ 1 1.5 0

execute as @s[scores={cdTick=0}] run attribute @s minecraft:jump_strength base set 0
execute as @s[scores={cdTick=60}] run attribute @s minecraft:jump_strength base reset
effect give @s[scores={cdTick=0}] minecraft:slowness 3 2 true

scoreboard players set @s[scores={playerState=1,cdTick=70..}] energy 45
scoreboard players set @s[scores={playerState=1,cdTick=70..}] playerState 0

execute at @s[scores={playerState=0,playerLastState=1}] run playsound entity.experience_orb.pickup master @p ~ ~ ~ 1 1 0

# Skill 2
scoreboard players set @s[scores={cdSec2=15..}] cdTick2 -1
item replace entity @s[scores={cdTick2=0}] container.7 with barrier[custom_name={"bold":true,"color":"red","italic":false,"text":"技能冷却中..."},custom_data={tag:cd2}] 15

effect give @s[scores={cdTick2=0}] minecraft:absorption 15 2 true
execute at @s[scores={cdTick2=0}] run playsound minecraft:item.armor.equip_gold master @a ~ ~ ~ 1 1 0

# End
execute run scoreboard players operation @s usingItemLast = @s usingItem
