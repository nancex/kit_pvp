give @s diamond_hoe[consumable={consume_seconds:999999,animation:"bow",has_consume_particles:false},unbreakable={},custom_name=[{"bold":true,"color":"#FF5500","italic":false,"text":"烈焰拳"},{"bold":false,"color":"gray","italic":false,"text":" (右键蓄力)"}],attribute_modifiers=[{id:"attack_damage",type:"attack_damage",amount:1,operation:"add_value"}],item_model=resin_clump,custom_data={shouldClear:1b}] 1

give @s paper[custom_name={"bold":true,"color":"green","italic":false,"text":"英雄介绍"},lore=[{"bold":true,"color":"#FF5500","italic":false,"text":"主动技能1: 烈焰冲拳"},{"color":"white","italic":false,"text":"向前冲出，对触碰到的敌人打出强力一拳"},{"color":"white","italic":false,"text":"蓄力时间越长，距离越远，伤害越高"},{"color":"gray","italic":false,"text":"触发：（踩在地上）右键蓄力，松开释放"},{"bold":true,"color":"#ff3500","italic":false,"text":"主动技能2: 上勾拳"},{"color":"white","italic":false,"text":"打出上勾一拳并腾空，伤害并且击飞周围敌人"},{"color":"gray","italic":false,"text":"触发：蹲下时跳跃"},{"bold":true,"color":"#ff0000","italic":false,"text":"主动技能3: 裂地重拳"},{"color":"white","italic":false,"text":"向下猛击地面，对周围敌人造成伤害"},{"color":"white","italic":false,"text":"释放技能后，滞空时间越长，伤害越高"},{"color":"gray","italic":false,"text":"触发：腾空时（至少两格高）下蹲"},{"bold":true,"color":"gold","italic":false,"text":"被动技能: 强化拳"},{"color":"white","italic":false,"text":"使用技能后，普攻短暂获得强化"}],custom_data={shouldClear:1b}] 1

item replace entity @s container.35 from entity Nancex container.6
execute unless items entity @s[team=!protected,gamemode=adventure] hotbar.6 minecraft:barrier unless items entity @s hotbar.6 minecraft:white_stained_glass_pane run item replace entity @s hotbar.6 with white_stained_glass_pane[custom_name={"bold":true,"color":"red","italic":false,"text":"冷却时间槽"}]

tag @s add Punch

execute as @s run function nancex:trigger/spread