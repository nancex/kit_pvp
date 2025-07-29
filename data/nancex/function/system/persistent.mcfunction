# Init player
spawnpoint @a[team=] 1000 -50 0
execute as @a[team=] run function nancex:trigger/reset

# Persistent
tag @e[type=minecraft:item,nbt=!{Item:{components:{"minecraft:custom_data": {"dontkill":1b}}}}] add should_kill
tag @e[type=minecraft:item,nbt={Item:{id:"minecraft:gold_nugget"}}] remove should_kill
tag @e[type=minecraft:item,nbt={Item:{id:"minecraft:gold_ingot"}}] remove should_kill
tag @e[type=minecraft:item,nbt={Item:{id:"minecraft:gold_block"}}] remove should_kill
kill @e[tag=should_kill]
clear @a minecraft:glass_bottle

# Triggers
execute as @a[scores={trigger=1}] run function nancex:trigger/reset
tp @a[scores={trigger=2}] 977 8 22
scoreboard players enable @a[scores={trigger=1..}] trigger
scoreboard players set @a[scores={trigger=1..}] trigger 0

# Spawn
execute positioned 1000 -50 0 run scoreboard players add @a[distance=0..2] spawnTick 1
execute as @a[scores={spawnTick=10..}] run function nancex:trigger/spread
scoreboard players reset @a[scores={spawnTick=10..}] spawnTick

# Should kill
tag @e[type=minecraft:witch] add should_kill
