scoreboard players set @s[scores={cdSec=25..}] cdTick -1
item replace entity @s[scores={cdTick=0}] container.8 with barrier[custom_name={"bold":true,"color":"red","italic":false,"text":"技能冷却中..."},custom_data={tag:cd1}] 25

execute at @s[scores={cdTick=100}] run playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 0.85 1.5 0.5
execute at @s[scores={cdTick=0..100}] run particle minecraft:smoke ~ ~ ~ 0.6 0 0.6 0.05 20 force @a

execute at @s[scores={cdTick=20}] run playsound minecraft:block.anvil.place master @a ~ ~ ~ 0.7 1
execute at @s[scores={cdTick=40}] run playsound minecraft:block.anvil.place master @a ~ ~ ~ 0.7 1
execute at @s[scores={cdTick=60}] run playsound minecraft:block.anvil.place master @a ~ ~ ~ 0.7 1
execute at @s[scores={cdTick=80}] run playsound minecraft:block.anvil.place master @a ~ ~ ~ 0.7 1

execute at @s[scores={cdTick=100..115}] run particle minecraft:flame ~ ~ ~ 0 0 0 0.2 15 force @a

clear @s[scores={cdTick=100}] minecraft:iron_sword
give @s[scores={cdTick=100}] minecraft:netherite_sword[minecraft:unbreakable={},enchantments={"minecraft:fire_aspect":1},custom_data={shouldClear:1b}]
clear @s[scores={cdTick=300}] minecraft:netherite_sword
give @s[scores={cdTick=300}] minecraft:iron_sword[minecraft:unbreakable={},custom_data={shouldClear:1b}] 1

effect give @s[scores={cdTick=0}] minecraft:slowness 5 2 true
execute as @s[scores={cdTick=0}] run attribute @s minecraft:jump_strength base set 0
execute as @s[scores={cdTick=100}] run attribute @s minecraft:jump_strength base reset
effect give @s[scores={cdTick=100}] minecraft:speed 4 2 true
effect give @s[scores={cdTick=300}] minecraft:blindness 2 1 true
effect give @s[scores={cdTick=300}] minecraft:slowness 2 3 true
effect give @s[scores={cdTick=0}] minecraft:absorption 15 3 true

item replace entity @s[scores={cdTick=20}] armor.feet with minecraft:netherite_boots[minecraft:unbreakable={},custom_data={shouldClear:1b}]
item replace entity @s[scores={cdTick=40}] armor.legs with minecraft:netherite_leggings[minecraft:unbreakable={},custom_data={shouldClear:1b}]
item replace entity @s[scores={cdTick=60}] armor.chest with minecraft:netherite_chestplate[minecraft:unbreakable={},custom_data={shouldClear:1b}]
item replace entity @s[scores={cdTick=80}] armor.head with minecraft:netherite_helmet[minecraft:unbreakable={},custom_data={shouldClear:1b}]

item replace entity @s[scores={cdTick=300}] armor.head with minecraft:chainmail_helmet[minecraft:unbreakable={},custom_data={shouldClear:1b}]
item replace entity @s[scores={cdTick=300}] armor.chest with minecraft:iron_chestplate[minecraft:unbreakable={},custom_data={shouldClear:1b}]
item replace entity @s[scores={cdTick=300}] armor.legs with minecraft:chainmail_leggings[minecraft:unbreakable={},custom_data={shouldClear:1b}]
item replace entity @s[scores={cdTick=300}] armor.feet with minecraft:iron_boots[minecraft:unbreakable={},custom_data={shouldClear:1b}]

clear @s[scores={cdTick=300}] minecraft:netherite_boots
clear @s[scores={cdTick=300}] minecraft:netherite_leggings
clear @s[scores={cdTick=300}] minecraft:netherite_chestplate
clear @s[scores={cdTick=300}] minecraft:netherite_helmet

execute unless score @s kill = @s killCount run give @s[tag=!player_boss] potion[custom_name={"bold":true,"color":"red","italic":false,"text":"血瓶"},potion_contents={custom_color:13565952,custom_effects:[{id:"minecraft:instant_health",amplifier:0,duration:1,show_particles:0b,show_icon:1b},{id:"minecraft:regeneration",amplifier:2,duration:40}]},consumable={consume_seconds:0.5,animation:"eat"},custom_data={shouldClear:1b}] 1

execute unless score @s kill = @s killCount run give @s[tag=player_boss] potion[custom_name={"bold":true,"color":"red","italic":false,"text":"微弱血瓶"},potion_contents={custom_color:13565952,custom_effects:[{id:"minecraft:instant_health",amplifier:0,duration:1,show_particles:0b,show_icon:1b}]},consumable={consume_seconds:0.5,animation:"eat"},custom_data={shouldClear:1b}] 1
