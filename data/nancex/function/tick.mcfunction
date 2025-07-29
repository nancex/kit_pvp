
function nancex:system/persistent
function nancex:system/timer_start
function nancex:system/kit
function nancex:system/event

execute as @a[tag=ArmorGuy] run function nancex:kit/armor_guy
execute as @a[tag=Wither] run function nancex:kit/wither
execute as @a[tag=Elf] run function nancex:kit/elf
execute as @a[tag=Thunder] run function nancex:kit/thunder
execute as @a[tag=MachineGun] run function nancex:kit/machine_gun
execute as @a[tag=Punch] run function nancex:kit/punch

execute as @a run scoreboard players operation @s playerLastState = @s playerState

function nancex:system/timer_end

function nancex:fun/pve
function nancex:fun/misc

# Kill reward
execute as @a unless score @s kill = @s killCount run give @s minecraft:gold_nugget 5
execute as @a unless score @s kill = @s killCount run scoreboard players operation @s kill = @s killCount
scoreboard players set @a[scores={death=1..}] death 0
