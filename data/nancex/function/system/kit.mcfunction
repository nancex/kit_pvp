execute as @a[team=!protected,gamemode=adventure] unless items entity @s hotbar.8 minecraft:barrier unless items entity @s hotbar.8 minecraft:white_stained_glass_pane run item replace entity @s hotbar.8 with white_stained_glass_pane[custom_name={"bold":true,"color":"red","italic":false,"text":"冷却时间槽"}]
execute as @a[team=!protected,gamemode=adventure] unless items entity @s hotbar.7 minecraft:barrier unless items entity @s hotbar.7 minecraft:white_stained_glass_pane run item replace entity @s hotbar.7 with white_stained_glass_pane[custom_name={"bold":true,"color":"red","italic":false,"text":"冷却时间槽"}]

execute as @a[scores={useItem=1,cdTick=25..}] run tellraw @s {"color":"red","text":"呜呜〒▽〒，当前技能还在冷却中..."}
execute as @a[scores={useItem=1,cdTick=25..}] at @s run playsound minecraft:block.note_block.basedrum master @s ~ ~ ~ 1 0.5 1

execute as @a[scores={useItem=2,cdTick2=25..}] run tellraw @s {"color":"red","text":"呜呜〒▽〒，当前技能还在冷却中..."}
execute as @a[scores={useItem=2,cdTick2=25..}] at @s run playsound minecraft:block.note_block.basedrum master @s ~ ~ ~ 1 0.5 1

# Player ID
execute as @a unless score @s ID = @s ID store result score @s ID run scoreboard players add #new ID 1
