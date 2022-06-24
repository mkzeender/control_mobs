
execute if score @s mctrlmobs.itemcooldown matches -39..0 if predicate mctrlmobs:looking_at_mob run function mctrlmobs:zzz/guardian/show_laser
execute if score @s mctrlmobs.itemcooldown matches ..-40 if predicate mctrlmobs:looking_at_mob run function mctrlmobs:zzz/guardian/laser

execute if score @s mctrlmobs.itemcooldown matches ..-1 unless predicate mctrlmobs:looking_at_mob run scoreboard players set @s mctrlmobs.itemcooldown 0