class_name HandlerFishboneShardsGenerator
extends Node
## Passively generates fishbone shards.

## Singleton reference.
static var ref : HandlerFishboneShardsGenerator


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
	if Game.ref.data.ti_upgrades.u_01_fishbone_shards_generation_level:
		timer.start()
		return
		
	HandlerTIUpgrades.ref.upgrade_leveled_up.connect(watch_for_upgrades_level_up)

		
## Triggered when the timer completes a loop.
func _on_timer_timeout() -> void:
	HandlerFishboneShards.ref.create_fishbone_shards(1)
	
## Wait for tiu_01 to be purchased. 
func watch_for_upgrades_level_up(upgrade : Upgrade) -> void:
	if upgrade == HandlerTIUpgrades.ref.u_01_fishbone_shard_generation:
		timer.start()
		HandlerTIUpgrades.ref.upgrade_leveled_up.disconnect(watch_for_upgrades_level_up)
