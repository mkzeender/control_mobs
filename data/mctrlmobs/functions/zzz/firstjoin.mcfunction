

scoreboard players add mctrlmobsmanager muserid 1

scoreboard players operation @s muserid = mctrlmobsmanager muserid

#give 1st player options book
execute if score @s muserid matches 1 run function mctrlmobs:options