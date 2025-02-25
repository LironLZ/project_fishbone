class_name HandlerTIUpgrades
extends Node
## Manages Tidal Instinct upgrades.

## Singleton reference.
static var ref : HandlerTIUpgrades


## Singleton check.
func _enter_tree() -> void:
	if not ref:
		ref = self
		return
	queue_free()



## Emitted when an upgrade has leveled up.
signal upgrade_leveled_up(upgrade : Upgrade)

## Reference to TIUpgrade 01.
@onready var u_01_fishbone_shard_generation : TIU01FishboneShardsGenerator = TIU01FishboneShardsGenerator.new()

## Returns all TIUpgrades.
func get_all_upgrades() -> Array[Upgrade]:
	return [
		u_01_fishbone_shard_generation,
	]
