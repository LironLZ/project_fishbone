class_name TIU02FishboneShardsBoost
extends Upgrade

## TIU02 Upgrade: Increases the amount of fishbone shards generated per second.

## Max Level.
var max_level : int = 5

## Initialize values.
func _init() -> void:
	level = Game.ref.data.ti_upgrades.u_02_fishbone_shards_boost_level
	title = "Fishbone Shards Generator Efficiency"
	base_cost = 1
	cost = 1

## Returns the description of the upgrade.
func description() -> String:
	var text : String = "Increase the amount of Fishbone Shards generated by the Ocean."
	text += "\n[b]Effects :[/b] +1 fishbone shards / sec."
	if level < max_level:
		text += "\n[b]Cost :[/b] %s Tidal Instinct" %cost
	return text


## Returns whether or not the player can afford buying the upgrade.
func can_afford() -> bool:
	if level >= max_level:
		return false

	if Game.ref.data.tidal_instinct >= cost:
		return true

	return false

## Consumes Tidal Instinct to level up.
func level_up() -> void:
	if level >= max_level:
		return

	var error : Error = HandlerTidalInstinct.ref.consume_tidal_instinct(cost)

	if error:
		return

	level += 1
	Game.ref.data.ti_upgrades.u_02_fishbone_shards_boost_level = level
	
	leveled_up.emit()
	HandlerTIUpgrades.ref.upgrade_leveled_up.emit(self)
