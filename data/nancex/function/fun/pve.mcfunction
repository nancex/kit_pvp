# Mob name
execute as @e[type=#minecraft:undead] store result score @s hurtTime run data get entity @s HurtTime
tag @e[type=#minecraft:undead,sort=random,limit=1,scores={hurtTime=1..}] add toAppendHP
execute as @e[tag=toAppendHP] store result score #toAppendHP temp run data get entity @s Health 1
execute if entity @e[tag=toAppendHP,nbt={Tags:["hellSoldier"]}] run data modify block 977 -1 18 front_text.messages[0] set value [{"bold":true,"color":"dark_red","italic":false,"text":"地狱士兵"},{"bold":true,"color":"white","italic":false,"text":"  [HP "},{"bold":true,"color":"red","italic":false,"score":{"name":"#toAppendHP","objective":"temp"}},{"bold":true,"color":"white","text":"]"}]
data modify entity @n[tag=toAppendHP] CustomName set from block 977 -1 18 front_text.messages[0]
tag @e[tag=toAppendHP] remove toAppendHP
