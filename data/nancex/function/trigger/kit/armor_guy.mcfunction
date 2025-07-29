give @s minecraft:iron_sword[minecraft:unbreakable={},custom_data={shouldClear:1b}]
give @s carrot_on_a_stick[custom_name=[{"bold":true,"color":"gold","italic":false,"text":"魔铠降世"},{"bold":false,"color":"gray","italic":false,"text":" (右键释放)"}],minecraft:item_model=netherite_chestplate,custom_data={skill1:1b,shouldClear:1b}] 1
item replace entity @s armor.head with minecraft:chainmail_helmet[minecraft:unbreakable={},custom_data={shouldClear:1b}]
item replace entity @s armor.chest with minecraft:iron_chestplate[minecraft:unbreakable={},custom_data={shouldClear:1b}]
item replace entity @s armor.legs with minecraft:chainmail_leggings[minecraft:unbreakable={},custom_data={shouldClear:1b}]
item replace entity @s armor.feet with minecraft:iron_boots[minecraft:unbreakable={},custom_data={shouldClear:1b}]
give @s paper[custom_name={"bold":true,"color":"green","italic":false,"text":"英雄介绍"},lore=[{"bold":true,"color":"gold","italic":false,"text":"主动技能: 魔铠降世"},{"color":"white","italic":false,"text":"召唤并装备魔铠"},{"color":"white","italic":false,"text":"同时获得巨额护盾，完成后小段加速"},{"color":"white","italic":false,"text":"脱下时会疲惫一秒"},{"bold":true,"color":"red","italic":false,"text":"被动技能: 嗜血"},{"color":"white","italic":false,"text":"造成击杀后将敌人制成血瓶"},{"color":"white","italic":false,"text":"血瓶可提供瞬间治疗与生命恢复"}],custom_data={shouldClear:1b}] 1

tag @s add ArmorGuy
execute as @s run function nancex:trigger/spread
