give @s iron_sword[attribute_modifiers=[{id:"attack_damage",type:"attack_damage",amount:2,operation:"add_value"}],custom_name={"bold":true,"color":"white","italic":false,"text":"军用小刀"},enchantments={"minecraft:knockback":1},unbreakable={},enchantment_glint_override=false,custom_data={shouldClear:1b}] 1
give @s diamond_hoe[consumable={consume_seconds:999999,animation:"bow",has_consume_particles:false},unbreakable={},custom_name=[{"bold":true,"color":"white","italic":false,"text":"机枪"},{"bold":false,"color":"gray","italic":false,"text":" (右键射击)"}],attribute_modifiers=[{id:"attack_damage",type:"attack_damage",amount:1,operation:"add_value"}],custom_data={shouldClear:1b},minecraft:item_model=crossbow] 1
give @s carrot_on_a_stick[custom_name=[{"bold":true,"color":"dark_red","italic":false,"text":"换弹"},{"bold":false,"color":"gray","italic":false,"text":" (右键使用)"}],minecraft:item_model=nether_brick,custom_data={skill1:1b,shouldClear:1b}] 1
give @s carrot_on_a_stick[custom_name=[{"bold":true,"color":"gold","italic":false,"text":"护甲包"},{"bold":false,"color":"gray","italic":false,"text":" (右键使用)"}],minecraft:item_model=golden_chestplate,custom_data={skill2:1b,shouldClear:1b}] 1

item replace entity @s armor.head with minecraft:iron_helmet[minecraft:unbreakable={},custom_data={shouldClear:1b}]
item replace entity @s armor.chest with minecraft:leather_chestplate[dyed_color=10329495,minecraft:unbreakable={},custom_data={shouldClear:1b}] 1
item replace entity @s armor.legs with minecraft:leather_leggings[dyed_color=10329495,minecraft:unbreakable={},custom_data={shouldClear:1b}] 1
item replace entity @s armor.feet with minecraft:iron_boots[minecraft:unbreakable={},custom_data={shouldClear:1b}]

give @s paper[custom_name={"bold":true,"color":"green","italic":false,"text":"英雄介绍"},lore=[{"bold":true,"color":"gray","italic":false,"text":"主动技能1: 机枪扫射"},{"color":"white","italic":false,"text":"使用机枪持续发射子弹，对敌人造成伤害"},{"bold":true,"color":"dark_red","italic":false,"text":"主动技能2: 换弹"},{"color":"white","italic":false,"text":"更换弹匣，期间移动减速并且无法跳跃"},{"bold":true,"color":"gold","italic":false,"text":"主动技能3: 护甲包"},{"color":"white","italic":false,"text":"使用后立即获得护甲"}],custom_data={shouldClear:1b}] 1

scoreboard players set @s energy 45

tag @s add MachineGun
execute as @s run function nancex:trigger/spread
