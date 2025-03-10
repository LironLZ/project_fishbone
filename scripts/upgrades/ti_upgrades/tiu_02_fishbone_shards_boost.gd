class_name TIU02FishboneShardsBoost
extends Upgrade

## TIU02 Upgrade: Increases the amount of fishbone shards generated per second.

## Max Level.
var max_level : int = 5

## Initialize values.
func _init() -> void:
	level = Game.ref.data.ti_upgrades.u_02_fishbone_shards_boost_level
	base_cost = 1
	cost = 1
	
	if not is_unlocked():
		HandlerTIUpgrades.ref.u_01_fishbone_shard_generation.leveled_up.connect(_on_tiu01_level_up)
		
		
## Returns the title of the upgrade.
func title() -> String:
	var text : String = "Fishbone Shards Generator Efficiency"
	
	match level:
		0:
			text += " "
		1:
			text += " I"
		2:
			text += " II"
		3:
			text += " III"
		4:
			text += " IV"
		5: 
			text += " V"
	return text

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
	
	
## Returns whether or not the upgrade has been unlocked.
func is_unlocked() -> bool:
	if Game.ref.data.ti_upgrades.u_01_fishbone_shards_generation_level:
		return true
		
	return false
	
## Triggered when TIU01 is purchased. Unlocks this upgrade.
func _on_tiu01_level_up() -> void:
	HandlerTIUpgrades.ref.u_01_fishbone_shard_generation.leveled_up.disconnect(_on_tiu01_level_up)
	HandlerTIUpgrades.ref.upgrade_unlocked.emit(self)


## Returns whether or not the upgrade has been disabled.
func is_disabled() -> bool:
	if level >= max_level:
		return true
		
	return false
