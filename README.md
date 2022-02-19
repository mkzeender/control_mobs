Minecraft but you can Control the Mobs
--------------------------------------

This datapack allows you to control the mobs in Minecraft! Want to do "Minecraft, but the mobs are controlled by a player"? This is for you!

Punch a mob to become it. Become a creeper and explode! Become the Ender Dragon, fly around and shoot dragon fireballs! You name it. Every mob has unique abilities, strength, health, and weapons.


HOW TO USE
----------
Run the command:
/execute as PLAYERNAME run function mctrlmobs:mob_controller

This will make the player called PLAYERNAME into a mob controller (in spectator mode). To switch back to a normal survival player, use:
  /execute as PLAYERNAME run function mctrlmobs:normal_player

Alternatively, the following command gives survival players a one-time-use item to let them control a mob:
  /execute as PLAYERNAME run function mctrlmobs:get_hypno_item

See the "Use Without Cheats" section for info about how to obtain this item without commands.

Become a mob:
When in spectator mode, punch a mob to become it.

You can also use the /spectate command and the /summon command:
  /spectate ...
  /summon ... ~ ~ ~

You will be automatically equipped with weapons, armor, effects, attributes, and special ability items.

Use special abilities:
Right-click using the special ability item (carrot_on_a_stick) to use a special ability. Special abilities include:
Creepers: Explode. Click again to cancel the explosion.
Flying mobs: Go up.
Endermen: Teleport in the direction you are looking
Evokers: Summon evoker fangs


Leave a mob:
Right-click using the Exit Mob item (fungus_on_a_stick) to leave a mob and return to spectator mode.


USE WITHOUT CHEATS
------------------
	It is possible to use all the features purely in survival mode!!!
	Just enable the Crafting option in the Options Book (see OPTIONS)

OPTIONS
-------
The first player to join the world will get an Options Book with the following options:
1. Pseudo-hardcore mode.
When this is enabled, players who die will become mob-controllers (in spectator mode)

2. Crafting Mob Controller
When this is enabled, you can craft a mob controlling item using a clock and a string
	
To modify the options once they have been chosen, use the command:
  /function mctrlmobs:options



COMBAT AND MOB ABILITIES
------------------------
Melee
Only some mobs can use melee combat.
Examples: zombies, endermen, iron golems, etc (even bees!)
NOT: skeletons, creepers, cows, etc.
Some mobs are also given weapons.

Projectiles
Ender dragons, Withers, and Ghasts can throw acid bombs, wither skulls, and fireballs, respectively.
Skeletons have bows, pillagers and piglins have crossbows, etc.
Blazes have flame bows.
Some drowneds have tridents

Creepers: Yes, they explode!
Endermen: Yes, they teleport!

Flying
Certain mobs can fly! This includes withers, ghasts, blazes, bees, etc.

TEAM MOBS: the mobs are on your team!
Hostile mobs won't attack you when you are a hostile mob. Nor when you are a passive animal.

Exceptions:
	Endermen, zombie piglins, etc. will still attack you if provoked
	Iron golems will always attack you if you are a hostile mob
	You will be attacked as normal as a villager or iron golem.
	Piglins (and brutes) are on their own team, and will be attacked by all other hostile mobs and vice versa.
	The wither will attack you.
	Some mobs do unintentional damage (such as slimes and magma cubes) when you touch them.

Health
When you become a mob, your health bar will be modified to match that of the mob.
You will also be temporarily given poison or regen so that your health starts out the same as the mob you became.
You can't eat food to regenerate (although boss mobs can regenerate in other ways). You also won't get hungry.

Weaknesses and Strengths:
Certain mobs have their plusses and minuses:
	Some can only breathe underwater.
	Others can't touch water.
	Some burn in sunlight.
	Some can't come to the overworld.
	Some fly.
	Some are fire resistant.
	
BOSS FIGHTS
-----------
Ender Dragon:
End crystals give you regeneration.
Enjoy your elytra and firework rockets to fly!
Perch on the exit portal, or you will start to lose health.
After perching, charge at a player to launch them into the air.
Shoot unlimited acid fireballs (very OP).

Wither (very OP):
Shoot unlimited wither skulls.
Perpetual regeneration.
Stand next to any block to break it. Also, Haste 100 effect!
Fly (when above half health)
Projectile protection 20 (when below half health)


HEADS
-----
When you are a mob, you will wear its head.

Other than that, you will unfortunately look like a normal player.
There is no way I know of to truly visually turn you into a mob using a datapack.


NEW IN LATEST UPDATE
--------------------
Enchantments on mob weapons and armor is now copied over to the player
Mob damage is now calculated via a formula to be more balanced
Endermen can teleport!
Looting enchantment and fire aspect now work on mob-controlled players!
More mob heads.

PLANNED FEATURES
----------------
	3. Copy attributes from mob to player (currently only generic.max_health and generic.attack_damage work).
	4. Copy potion effects for spiders
	5. Speed for some baby mobs


LICENSING
---------
	You may use or build upon this datapack however you choose as long as you give me credit.
