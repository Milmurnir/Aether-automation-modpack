# Aether Automation: longer day/night cycle (datapack, no mod).
# doDaylightCycle is turned OFF and this pack advances the sun manually, so days last
# longer while night still skips once enough players sleep.
#
# === HOW TO CHANGE (edit a number, then /reload) ===
#   ratio   = real ticks per 1 tick of sun movement.  2 = double length (default),
#             3 = triple, 1 = vanilla speed.
#   percent = % of online players that must sleep to skip the night. 10 = 10% (default,
#             vanilla is 100).

scoreboard objectives add aa_day dummy

# --- tunables ---
scoreboard players set #ratio aa_day 2
scoreboard players set #percent aa_day 10

# --- constants (do not change) ---
scoreboard players set #C24000 aa_day 24000
scoreboard players set #C100 aa_day 100

# --- runtime state ---
scoreboard players set #ctr aa_day 0
scoreboard players set #skip aa_day 0

# take over the day/night cycle
gamerule doDaylightCycle false
