item replace entity @s armor.head with leather_helmet[dyed_color=0,minecraft:unbreakable={},custom_data={shouldClear:1b}] 1
item replace entity @s armor.chest with minecraft:leather_chestplate[dyed_color=0,minecraft:unbreakable={},custom_data={shouldClear:1b}] 1
item replace entity @s armor.legs with minecraft:leather_leggings[dyed_color=0,minecraft:unbreakable={},custom_data={shouldClear:1b}] 1
item replace entity @s armor.feet with minecraft:golden_boots[minecraft:unbreakable={},custom_data={shouldClear:1b}] 1
give @s minecraft:golden_hoe[attribute_modifiers=[{id:"attack_damage",type:"attack_damage",amount:6,operation:"add_value"}],unbreakable={show_in_tooltip:true},custom_data={shouldClear:1b}] 1
give @s carrot_on_a_stick[custom_name=[{"bold":true,"color":"white","italic":false,"text":"雾遁"},{"bold":false,"color":"gray","italic":false,"text":" (右键切换)"}],minecraft:item_model=wither_skeleton_skull,custom_data={skill1:1b,shouldClear:1b}] 1

scoreboard players set @s energy 40
give @s paper[custom_name={"bold":true,"color":"green","italic":false,"text":"英雄介绍"},lore=[{"bold":true,"color":"gray","italic":false,"text":"主动技能: 雾遁"},{"color":"white","italic":false,"text":"化为黑雾，对途径敌人造成凋零效果"},{"color":"white","italic":false,"text":"黑雾形态消耗凋零能量，并获得大幅度伤害减免"},{"color":"white","italic":false,"text":"需要至少20能量来启动"},{"bold":true,"color":"red","italic":false,"text":"被动技能: 魂吸"},{"color":"white","italic":false,"text":"造成击杀后吸取敌人灵魂"},{"color":"white","italic":false,"text":"瞬间恢复50能量(可超出上限)"}],custom_data={shouldClear:1b}] 1

tag @s add Wither
execute as @s run function nancex:trigger/spread

