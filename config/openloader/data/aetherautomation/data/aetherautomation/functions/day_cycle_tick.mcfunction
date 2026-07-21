# runs every tick (minecraft:tick)

# 1. advance the sun at 1/ratio of normal speed (longer days)
scoreboard players add #ctr aa_day 1
execute if score #ctr aa_day >= #ratio aa_day run time add 1
execute if score #ctr aa_day >= #ratio aa_day run scoreboard players set #ctr aa_day 0

# 2. current time-of-day (0..23999)
execute store result score #tod aa_day run time query daytime
scoreboard players operation #tod aa_day %= #C24000 aa_day

# 3. if a night-skip is running, fast-forward to dawn then stop
execute if score #skip aa_day matches 1 run time add 150
execute if score #skip aa_day matches 1 store result score #tod aa_day run time query daytime
execute if score #skip aa_day matches 1 run scoreboard players operation #tod aa_day %= #C24000 aa_day
execute if score #skip aa_day matches 1 if score #tod aa_day matches 0..1000 run scoreboard players set #skip aa_day 0

# 4. start a night-skip when >= percent% of players are asleep (night only)
execute store result score #players aa_day if entity @a
execute store result score #sleeping aa_day if entity @a[nbt={SleepTimer:100s}]
scoreboard players operation #a aa_day = #sleeping aa_day
scoreboard players operation #a aa_day *= #C100 aa_day
scoreboard players operation #b aa_day = #players aa_day
scoreboard players operation #b aa_day *= #percent aa_day
execute if score #skip aa_day matches 0 if score #sleeping aa_day matches 1.. if score #a aa_day >= #b aa_day if score #tod aa_day matches 12542..23999 run scoreboard players set #skip aa_day 1
