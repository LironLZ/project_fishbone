class_name HandlerFishboneShardsGenerator
extends Node
## Passively generates fishbone shards.

## Singleton reference.
static var ref : HandlerFishboneShardsGenerator

## Amount of Fishbone Shards generated every loop.
var generator_power : int = 1

## Singleton check.
func _enter_tree() -> void:
	if not ref:
		ref = self
		return
	queue_free()
	

## Reference to the  generator timer.
@export var timer : Timer

## Loads data.
func _ready() -> void:
	calculate_generator_power()
		
	HandlerTIUpgrades.ref.upgrade_leveled_up.connect(watch_for_upgrades_level_up)
	
	if Game.ref.data.ti_upgrades.u_01_fishbone_shards_generation_level:
		timer.start()
		return
	

	HandlerTIUpgrades.ref.u_01_fishbone_shard_generation.leveled_up.connect(watch_for_tiu01_level_up)

		
## Triggered when the timer completes a loop.
func _on_timer_timeout() -> void:
	HandlerFishboneShards.ref.create_fishbone_shards(generator_power)
	
## Triggered when an upgrade levels up. Recalculate generator power.
func watch_for_upgrades_level_up(upgrade : Upgrade) -> void:
	calculate_generator_power()
	
## Wait for tiu_01 to be purchased. 
func watch_for_tiu01_level_up() -> void:
	timer.start()
	HandlerTIUpgrades.ref.u_01_fishbone_shard_generation.leveled_up.disconnect(watch_for_tiu01_level_up)
		
		

## Calculate the amount of Fishbone Shards which should be created every seconds.
func calculate_generator_power() -> void:
	var new_power : int = 1
	new_power += Game.ref.data.ti_upgrades.u_02_fishbone_shards_boost_level
	
	generator_power = new_power
