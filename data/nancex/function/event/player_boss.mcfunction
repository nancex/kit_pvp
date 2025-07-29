execute if score _event_tick serverStatus matches 0 run execute as @a if items entity @s armor.head minecraft:golden_helmet run tag @s add player_boss
execute if score _event_tick serverStatus matches 0 run tellraw @a [{"color":"gray","italic":false,"text":"["},{"color":"red","italic":false,"text":"Event"},{"color":"gray","italic":false,"text":"] "},{"bold":true,"color":"white","selector":"@a[tag=player_boss]"},{"bold":true,"color":"red","italic":false,"text":" 佩戴了罪恶王冠！！！"}]
execute if score _event_tick serverStatus matches 0 run item replace entity @a[tag=player_boss] armor.head with air
execute if score _event_tick serverStatus matches 0 at @a run playsound minecraft:entity.ender_dragon.ambient master @p ~ ~ ~ 1 1 1
execute if score _event_tick serverStatus matches 0 run title @a times 1s 3s 1s
execute if score _event_tick serverStatus matches 0 run title @a title [{"bold":true,"color":"#0099FF","text":"特 "},{"color":"#3173FF","text":"殊 "},{"bold":true,"color":"#624DFF","text":"事 "},{"bold":true,"color":"#C300FF","text":"件"}]
execute if score _event_tick serverStatus matches 0 run title @a subtitle {"bold":true,"color":"red","italic":false,"text":"玩家Boss战"}
execute if score _event_tick serverStatus matches 100 run title @a times 0s 5t 0s

execute if score _event_tick serverStatus matches 0 run team modify player friendlyFire false

# Countdown
execute if score _event_tick serverStatus matches 100 run scoreboard players set _cd_sec serverStatus 10
execute if score _cd_tick_per_sec serverStatus matches 1 run tellraw @a [{"color":"gray","italic":false,"text":"["},{"color":"red","italic":false,"text":"Event"},{"color":"gray","italic":false,"text":"] "},{"color":"gray","italic":false,"text":"事件倒计时 "},{"bold":true,"color":"red","italic":false,"score":{"name":"_cd_sec","objective":"serverStatus"}},{"color":"gray","italic":false,"text":" 秒"}]
execute if score _cd_tick_per_sec serverStatus matches 1 at @a run playsound minecraft:block.note_block.harp master @p ~ ~ ~ 1 0.5 1

execute if score _event_tick serverStatus matches 300 run team join player_boss @a[tag=player_boss]
execute if score _event_tick serverStatus matches 300 at @a run playsound minecraft:block.note_block.harp master @p ~ ~ ~ 1 1.5 1
execute if score _event_tick serverStatus matches 300 run tellraw @a [{"color":"gray","italic":false,"text":"["},{"color":"red","italic":false,"text":"Event"},{"color":"gray","italic":false,"text":"] "},{"color":"green","italic":false,"text":"狩猎开始！ "}]
# Bossbar
bossbar set minecraft:boss_health name [{"bold":true,"color":"#00FFC3","text":"B"},{"color":"#00D0D2","text":"o"},{"color":"#00A2E1","text":"s"},{"color":"#0044FF","text":"s "},{"bold":true,"color":"white","selector":"@a[tag=player_boss]"},{"color":"#0033FF","text":" 剩"},{"color":"#2626FF","text":"余"},{"color":"#4D1AFF","text":"血"},{"color":"#9900FF","text":"量"}]
execute if score _event_tick serverStatus matches 0 run bossbar set minecraft:boss_health visible true
execute if score _event_tick serverStatus matches 0 run attribute @n[tag=player_boss] minecraft:max_health base set 60
execute if score _event_tick serverStatus matches 1 store result bossbar minecraft:boss_health max run attribute @n[tag=player_boss] minecraft:max_health get
execute store result bossbar minecraft:boss_health value run data get entity @n[tag=player_boss] Health

# Boss effects
execute if score _event_tick serverStatus matches 0 run effect give @a[tag=player_boss] minecraft:regeneration 15 3 true
execute if score _event_tick serverStatus matches 0 run attribute @n[tag=player_boss] minecraft:scale base set 1.3
execute if score _event_tick serverStatus matches 0 run attribute @n[tag=player_boss] minecraft:knockback_resistance base set 0.25
execute if score _event_tick serverStatus matches 300 run effect give @a[tag=player_boss] minecraft:regeneration infinite 0 true
execute if score _event_tick serverStatus matches 0 run effect give @a[tag=player_boss] minecraft:jump_boost infinite 0 true

execute if score _event_tick serverStatus matches 0 run effect give @a[tag=player_boss] minecraft:resistance infinite 1 true
execute if score _event_tick serverStatus matches 0 run effect clear @a[tag=ArmorGuy] minecraft:resistance
execute if score _event_tick serverStatus matches 0 run effect give @a[tag=player_boss] minecraft:resistance infinite 0 true

execute if score _event_tick serverStatus matches 0 run effect give @a[tag=player_boss] minecraft:speed infinite 0 true
execute if score _event_tick serverStatus matches 0 run effect give @a[tag=player_boss] minecraft:strength infinite 0 true
execute if score _event_tick serverStatus matches 0 run effect give @a[tag=player_boss] minecraft:glowing infinite 0 true
execute if score _event_tick serverStatus matches 0 run effect give @a[tag=player_boss] minecraft:absorption infinite 4 true

# Event end
execute if score _event_tick serverStatus matches 300.. unless entity @a[tag=player_boss,team=player_boss] run scoreboard players set _current_event serverStatus 0
execute if entity @a[tag=player_boss,scores={death=1..}] run scoreboard players set _current_event serverStatus 0

execute if score _current_event serverStatus matches 0 run team modify player friendlyFire true
execute if score _current_event serverStatus matches 0 run bossbar set minecraft:boss_health visible false
execute if score _current_event serverStatus matches 0 run tellraw @a [{"color":"gray","italic":false,"text":"["},{"color":"red","italic":false,"text":"Event"},{"color":"gray","italic":false,"text":"] "},{"bold":true,"color":"red","italic":false,"text":"Boss "},{"bold":true,"color":"white","selector":"@a[tag=player_boss]"},{"bold":true,"color":"red","italic":false,"text":" 被打倒了！"}]
execute if score _current_event serverStatus matches 0 at @a run playsound minecraft:entity.player.levelup master @p ~ ~ ~ 0.8 0.5 0.8
