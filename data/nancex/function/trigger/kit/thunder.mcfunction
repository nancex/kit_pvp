give @s diamond_hoe[consumable={consume_seconds:999999,animation:"bow",has_consume_particles:false},unbreakable={},custom_name=[{"bold":true,"color":"aqua","italic":false,"text":"聚雷法杖"},{"bold":false,"color":"gray","italic":false,"text":" (右键聚集)"}],attribute_modifiers=[{id:"attack_damage",type:"attack_damage",amount:2,operation:"add_value"}],enchantments={"minecraft:knockback":1},custom_data={shouldClear:1b}] 1
give @s carrot_on_a_stick[custom_name=[{"bold":true,"color":"blue","italic":false,"text":"雷罚"},{"bold":false,"color":"gray","italic":false,"text":" (右键释放)"}],minecraft:item_model=breeze_rod,custom_data={skill1:1b,shouldClear:1b}] 1
give @s carrot_on_a_stick[custom_name=[{"bold":true,"color":"red","italic":false,"text":"雷霆万钧"},{"bold":false,"color":"gray","italic":false,"text":" (右键释放)"}],item_model="netherite_upgrade_smithing_template",custom_data={skill2:1b,shouldClear:1b}] 1
item replace entity @s armor.head with minecraft:chainmail_helmet[minecraft:unbreakable={},custom_data={shouldClear:1b}]
item replace entity @s armor.chest with minecraft:leather_chestplate[dyed_color=3847130,minecraft:unbreakable={},custom_data={shouldClear:1b}] 1
item replace entity @s armor.legs with minecraft:leather_leggings[dyed_color=3847130,minecraft:unbreakable={},custom_data={shouldClear:1b}] 1
item replace entity @s armor.feet with minecraft:diamond_boots[minecraft:unbreakable={},custom_data={shouldClear:1b}]

give @s paper[custom_name={"bold":true,"color":"green","italic":false,"text":"英雄介绍"},lore=[{"bold":true,"color":"aqua","italic":false,"text":"主动技能1: 凝聚"},{"color":"white","italic":false,"text":"手握法杖，集中精神，可加快法力凝聚"},{"bold":true,"color":"blue","italic":false,"text":"主动技能2: 雷罚"},{"color":"white","italic":false,"text":"释放法力射线，触碰方块后召唤雷击"},{"color":"white","italic":false,"text":"每次消耗10法力"},{"bold":true,"color":"red","italic":false,"text":"主动技能3: 雷霆万钧"},{"color":"white","italic":false,"text":"消耗100法力，解除被封印的力量"},{"color":"white","italic":false,"text":"升向空中，同时在四周召唤雷电"},{"color":"white","italic":false,"text":"雷罚在此期间可以无限释放，并提升频率和射线速度"},{"color":"white","italic":false,"text":"在空中时获得高额的生命回复和抗性提升"}],custom_data={shouldClear:1b}] 1

scoreboard players set @s energy 50

tag @s add Thunder
execute as @s run function nancex:trigger/spread
