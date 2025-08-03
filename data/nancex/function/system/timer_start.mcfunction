# Skill 1
scoreboard players add @a[scores={cdTick=0..}] cdTick 1

execute as @a[scores={cdTick=0..}] run scoreboard players operation @s cdSec = @s cdTick
execute as @a[scores={cdTick=0..}] run scoreboard players operation @s cdSec /= $const_20 const
execute as @a[scores={cdTick=0..}] run scoreboard players operation @s cdPerSec = @s cdTick
execute as @a[scores={cdTick=0..}] run scoreboard players operation @s cdPerSec %= $const_20 const

execute as @a[scores={cdTick=-2,cdPerSec=0}] run scoreboard players set @s cdPerSec -1
# cdPerSec 1 = start from first sec, 0 = from second sec
clear @a[scores={cdPerSec=0}] minecraft:barrier[custom_data={tag:cd1}] 1
clear @a[scores={cdTick=-2}] minecraft:barrier[custom_data={tag:cd1}]

# Skill 2
scoreboard players add @a[scores={cdTick2=0..}] cdTick2 1

execute as @a[scores={cdTick2=0..}] run scoreboard players operation @s cdSec2 = @s cdTick2
execute as @a[scores={cdTick2=0..}] run scoreboard players operation @s cdSec2 /= $const_20 const
execute as @a[scores={cdTick2=0..}] run scoreboard players operation @s cdPerSec2 = @s cdTick2
execute as @a[scores={cdTick2=0..}] run scoreboard players operation @s cdPerSec2 %= $const_20 const

execute as @a[scores={cdTick2=-2,cdPerSec2=0}] run scoreboard players set @s cdPerSec2 -1

clear @a[scores={cdPerSec2=0}] minecraft:barrier[custom_data={tag:cd2}] 1
clear @a[scores={cdTick2=-2}] minecraft:barrier[custom_data={tag:cd2}]

# Skill 3
scoreboard players add @a[scores={cdTick3=0..}] cdTick3 1

execute as @a[scores={cdTick3=0..}] run scoreboard players operation @s cdSec3 = @s cdTick3
execute as @a[scores={cdTick3=0..}] run scoreboard players operation @s cdSec3 /= $const_20 const
execute as @a[scores={cdTick3=0..}] run scoreboard players operation @s cdPerSec3 = @s cdTick3
execute as @a[scores={cdTick3=0..}] run scoreboard players operation @s cdPerSec3 %= $const_20 const

execute as @a[scores={cdTick3=-2,cdPerSec3=0}] run scoreboard players set @s cdPerSec3 -1

clear @a[scores={cdPerSec3=0}] minecraft:barrier[custom_data={tag:cd3}] 1
clear @a[scores={cdTick3=-2}] minecraft:barrier[custom_data={tag:cd3}]



execute as @a[scores={useItem=1}] if items entity @s weapon.* minecraft:carrot_on_a_stick[minecraft:custom_data~{skill2:1b}] run scoreboard players set @s useItem 2

scoreboard players set @a[scores={useItem=1, cdTick=-2, canUseItem=1}] cdTick 0
scoreboard players set @a[scores={useItem=1, cdTick=-2, canUseItem=1}] cdSec 0
scoreboard players set @a[scores={useItem=2, cdTick2=-2, canUseItem2=1}] cdTick2 0
scoreboard players set @a[scores={useItem=2, cdTick2=-2, canUseItem2=1}] cdSec2 0
scoreboard players set @a[scores={useItem=3, cdTick3=-2, canUseItem3=1}] cdTick3 0
scoreboard players set @a[scores={useItem=3, cdTick3=-2, canUseItem3=1}] cdSec3 0

# Player timer
scoreboard players add @a[scores={timerTick=0..}] timerTick 1

execute as @a[scores={timerTick=0..}] run scoreboard players operation @s timerPer2T = @s timerTick
execute as @a[scores={timerTick=0..}] run scoreboard players operation @s timerPer2T %= $const_2 const
execute as @a[scores={timerTick=0..}] run scoreboard players operation @s timerPer3T = @s timerTick
execute as @a[scores={timerTick=0..}] run scoreboard players operation @s timerPer3T %= $const_3 const
execute as @a[scores={timerTick=0..}] run scoreboard players operation @s timerPerSec = @s timerTick
execute as @a[scores={timerTick=0..}] run scoreboard players operation @s timerPerSec %= $const_20 const

# Entity timer
scoreboard players add @e[type=!player] timerTick 1
