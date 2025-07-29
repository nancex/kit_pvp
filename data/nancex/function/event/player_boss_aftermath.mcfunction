execute as @a[tag=player_boss] run attribute @s minecraft:max_health base reset
execute as @a[tag=player_boss] run attribute @s minecraft:scale base reset
execute as @a[tag=player_boss] run attribute @s minecraft:knockback_resistance base reset
effect clear @a[tag=player_boss]

team join player @a[tag=player_boss]
tag @a[tag=player_boss] remove player_boss
