give @s wooden_sword[unbreakable={},enchantments={"minecraft:knockback":1},custom_name={"bold":true,"color":"white","italic":false,"text":"木剑"},custom_data={shouldClear:1b}] 1
give @s bow[unbreakable={},enchantments={"minecraft:power":1,"minecraft:punch":1,"minecraft:infinity":1},custom_name={"bold":true,"color":"white","italic":false,"text":"木弓"},custom_data={shouldClear:1b}] 1
give @s carrot_on_a_stick[custom_name=[{"bold":true,"color":"green","italic":false,"text":"会心一击"},{"bold":false,"color":"gray","italic":false,"text":" (右键释放)"}],minecraft:item_model=nether_star,custom_data={skill1:1b,shouldClear:1b}] 1
item replace entity @s container.9 with arrow[custom_data={shouldClear:1b}]

scoreboard players set @s energy 0
item replace entity @s armor.head with minecraft:iron_helmet[minecraft:unbreakable={},custom_data={shouldClear:1b}]
item replace entity @s armor.chest with minecraft:leather_chestplate[dyed_color=43019,minecraft:unbreakable={},custom_data={shouldClear:1b}] 1
item replace entity @s armor.legs with minecraft:leather_leggings[dyed_color=43019,minecraft:unbreakable={},custom_data={shouldClear:1b}] 1
item replace entity @s armor.feet with minecraft:iron_boots[minecraft:unbreakable={},custom_data={shouldClear:1b}]
give @s paper[custom_name={"bold":true,"color":"green","italic":false,"text":"英雄介绍"},lore=[{"bold":true,"color":"green","italic":false,"text":"主动技能: 会心一击"},{"color":"white","italic":false,"text":"立刻获得一次强化攻击"},{"color":"white","italic":false,"text":"对命中敌人造成巨量伤害"},{"bold":true,"color":"dark_green","italic":false,"text":"被动技能: 轻盈一跃"},{"color":"white","italic":false,"text":"缓慢凝聚自然能量，蓄满后可进行强化跳跃"},{"color":"white","italic":false,"text":"触发方法：下蹲时跳跃"}],custom_data={shouldClear:1b}] 1

tag @s add Elf
execute as @s run function nancex:trigger/spread
