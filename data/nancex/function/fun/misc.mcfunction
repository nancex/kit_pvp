# Disc
execute unless blocks 993 -62 -11 993 -62 -11 993 -59 -11 all run clone 993 -62 -11 993 -62 -11 993 -59 -11 replace

# Special blocks
execute as @a at @s if block ~ ~-1 ~ minecraft:light_blue_stained_glass run effect give @s minecraft:levitation 2 3 true

# Mine
give @a[scores={mineGoldOre=1..}] minecraft:gold_nugget 1
scoreboard players set @a[scores={mineGoldOre=1..}] mineGoldOre 0
execute if blocks 976 -62 21 978 -60 23 6 -9 -6 masked run clone 6 -9 -9 8 -7 -7 976 -62 21 replace

