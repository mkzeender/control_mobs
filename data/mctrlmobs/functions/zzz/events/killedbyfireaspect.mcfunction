advancement revoke @s only mctrlmobs:killedbyfireaspect

function mctrlmobs:zzz/select_controlled_mob

data modify entity @e[tag=iscontrolled,limit=1] Fire set value 20s

