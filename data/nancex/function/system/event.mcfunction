
# Event triggers
execute if score _current_event serverStatus matches 0 if items entity @a[team=player] armor.head minecraft:golden_helmet run scoreboard players set _current_event serverStatus 1

execute if score _event_tick serverStatus matches 0.. run scoreboard players operation _event_tick_per_sec serverStatus = _event_tick serverStatus
execute if score _event_tick serverStatus matches 0.. run scoreboard players operation _event_tick_per_sec serverStatus %= $const_20 const

execute unless score _current_event serverStatus = _last_event serverStatus if score _current_event serverStatus matches 1.. run scoreboard players set _event_tick serverStatus 0

execute if score _current_event serverStatus matches 1 run function nancex:event/player_boss
execute unless score _current_event serverStatus matches 1 run function nancex:event/player_boss_aftermath

execute unless score _current_event serverStatus = _last_event serverStatus if score _current_event serverStatus matches 0 run scoreboard players set _event_tick serverStatus -1

execute if score _event_tick serverStatus matches 0.. run scoreboard players add _event_tick serverStatus 1

scoreboard players operation _last_event serverStatus = _current_event serverStatus

# Event countdown
execute unless score _cd_tick_per_sec serverStatus = _cd_tick_per_sec serverStatus run scoreboard players set _cd_tick_per_sec serverStatus -1
execute if score _cd_sec serverStatus matches 1.. if score _cd_tick_per_sec serverStatus matches -1 run scoreboard players set _cd_tick_per_sec serverStatus 0
execute if score _cd_tick_per_sec serverStatus matches 0.. run scoreboard players add _cd_tick_per_sec serverStatus 1
execute if score _cd_tick_per_sec serverStatus matches 20 run scoreboard players remove _cd_sec serverStatus 1
execute if score _cd_tick_per_sec serverStatus matches 20 if score _cd_sec serverStatus matches ..0 run scoreboard players set _cd_tick_per_sec serverStatus -1
execute if score _cd_tick_per_sec serverStatus matches 20 run scoreboard players set _cd_tick_per_sec serverStatus 0
