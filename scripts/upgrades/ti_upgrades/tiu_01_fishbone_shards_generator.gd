class_name TIU01FishboneShardsGenerator
extends Upgrade
## Unlocks the passive Fishbone Shard generation.


var max_level : int = 1

func _init() -> void:
	level = Game.ref.data.ti_upgrades.u_01_fishbone_shards_generation_level
	title = "Awaken the Ocean"
	base_cost = 1
	calculate_cost()





## Returns the description of the upgrade.
func description() -> String:
	var text : String = "Awaken the Ocean to start generating Fishbone Shards."
	text += "\n[b]Effect :[/b] passive Fishbone Shard generation"
	if level < max_level:
		text += "\n[b]Cost :[/b] %s Tidal Instinct" %cost
	return text


## Returns the current cost based on level and base cost
func calculate_cost() -> void:
	cost = base_cost


## Returns whehter or not the player can afford buying the upgrade.
func can_afford() -> bool:
	if level >= max_level:
		return false
		
	if Game.ref.data.tidal_instinct >= cost:
		return true
		
	else: 
		return false




## Consumes Tidal Instinct to level up.
func level_up() -> void:
	if level >= max_level:
		return 
	
	var error : Error = HandlerTidalInstinct.ref.consume_tidal_instinct(cost)
	
	if error : 
		return 
		
	level += 1 
	Game.ref.data.ti_upgrades.u_01_fishbone_shards_generation_level = true
	# Increase level in Data Resource
	
	leveled_up.emit()
	HandlerTIUpgrades.ref.upgrade_leveled_up.emit(self)
	
## Returns whether or not the upgrade is unlocked. 
func is_unlocked() -> bool:
	return true
