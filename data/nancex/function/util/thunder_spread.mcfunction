summon minecraft:marker ~ ~ ~ {Tags:["thunder_spread"]}
summon minecraft:marker ~ ~ ~ {Tags:["thunder_spread"]}
summon minecraft:marker ~ ~ ~ {Tags:["thunder_spread"]}

execute at @n[tag=thunder_spread] run spreadplayers ~ ~ 6 5 under -20 false @e[tag=thunder_spread]
execute as @e[tag=thunder_spread] at @s run summon minecraft:lightning_bolt ~ ~ ~
kill @e[tag=thunder_spread]
