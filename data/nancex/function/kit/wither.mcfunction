scoreboard players set @s[scores={canUseItem=1,energy=..20,playerState=0}] canUseItem 0
scoreboard players set @s[scores={canUseItem=0,energy=21..}] canUseItem 1

scoreboard players add @s[scores={energy=..99,timerPer3T=0,playerState=0}] energy 1
title @s actionbar [{"bold":true,"color":"dark_gray","italic":false,"text":"凋零能量: "},{"score":{"name":"@s","objective":"energy"}},{"bold":true,"color":"dark_gray","italic":false,"text":" / 100"}]
scoreboard players add @s[scores={cdTick=0}] playerState 1
execute as @s[scores={cdTick=0,playerState=1..}] run scoreboard players operation @s playerState %= const_2 const
scoreboard players remove @s[scores={energy=1..,playerState=1}] energy 1
scoreboard players set @s[scores={energy=0,playerState=1}] playerState 0

scoreboard players set @s[scores={cdSec=1..}] cdTick -1
item replace entity @s[scores={playerState=0,playerLastState=1}] container.8 with barrier[custom_name={"bold":true,"color":"red","italic":false,"text":"技能冷却中..."},custom_data={tag:cd1}] 1
scoreboard players set @s[scores={playerState=1,playerLastState=0}] cdTick -1

execute at @s[scores={playerState=1,playerLastState=0}] run playsound minecraft:entity.ender_dragon.flap master @a ~ ~ ~ 1 0.6 1
effect give @s[scores={playerState=1,playerLastState=0}] minecraft:resistance infinite 3 true
effect give @s[scores={playerState=1,playerLastState=0}] minecraft:invisibility infinite 0 true
effect give @s[scores={playerState=1,playerLastState=0}] minecraft:speed infinite 4 true
execute at @s[scores={playerState=1}] run particle dust{color:[0.141,0.141,0.141],scale:2} ~-0.075 ~0.3 ~-0.075 0.225 1 0.225 0.01 10 force @a
execute at @s[scores={playerState=1}] run particle dust{color:[1.000,0.765,0.000],scale:2} ~-0.075 ~ ~-0.075 0.225 0.3 0.225 0.01 5 force @a
effect give @s[scores={playerState=1,playerLastState=0}] minecraft:jump_boost infinite 0 true
clear @s[scores={playerState=1,playerLastState=0}] minecraft:leather_helmet
clear @s[scores={playerState=1,playerLastState=0}] minecraft:leather_chestplate
clear @s[scores={playerState=1,playerLastState=0}] minecraft:leather_leggings
clear @s[scores={playerState=1,playerLastState=0}] minecraft:golden_boots
clear @s[scores={playerState=1,playerLastState=0}] minecraft:golden_hoe

effect clear @s[scores={playerState=0,playerLastState=1}] minecraft:resistance
effect clear @s[scores={playerState=0,playerLastState=1}] minecraft:invisibility
effect clear @s[scores={playerState=0,playerLastState=1}] minecraft:speed
effect clear @s[scores={playerState=0,playerLastState=1}] minecraft:jump_boost
item replace entity @s[scores={playerState=0,playerLastState=1}] armor.head with leather_helmet[dyed_color=0,minecraft:unbreakable={},custom_data={shouldClear:1b}] 1
item replace entity @s[scores={playerState=0,playerLastState=1}] armor.chest with minecraft:leather_chestplate[dyed_color=0,minecraft:unbreakable={},custom_data={shouldClear:1b}] 1
item replace entity @s[scores={playerState=0,playerLastState=1}] armor.legs with minecraft:leather_leggings[dyed_color=0,minecraft:unbreakable={},custom_data={shouldClear:1b}] 1
item replace entity @s[scores={playerState=0,playerLastState=1}] armor.feet with minecraft:golden_boots[minecraft:unbreakable={},custom_data={shouldClear:1b}] 1
give @s[scores={playerState=0,playerLastState=1}] minecraft:golden_hoe[attribute_modifiers=[{id:"attack_damage",type:"attack_damage",amount:6,operation:"add_value"}],unbreakable={show_in_tooltip:true},custom_data={shouldClear:1b}] 1

execute if score _current_event serverStatus matches 0 at @s[scores={playerState=1}] run effect give @e[distance=0.01..2] minecraft:wither 2 2 true
execute if score _current_event serverStatus matches 1 at @s[scores={playerState=1},team=player] run effect give @e[distance=0.01..2,team=!player] minecraft:wither 2 2 true
execute if score _current_event serverStatus matches 1 at @s[scores={playerState=1},team=player_boss] run effect give @e[distance=0.01..2] minecraft:wither 2 2 true
scoreboard players add @s[scores={kill=1}] energy 50
 