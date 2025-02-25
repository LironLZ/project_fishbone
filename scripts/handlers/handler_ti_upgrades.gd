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
## Emitted when an upgrade unlocks.
signal upgrade_unlocked(upgrade : Upgrade)

## Reference to TIUpgrade 01.
@onready var u_01_fishbone_shard_generation : TIU01FishboneShardsGenerator = TIU01FishboneShardsGenerator.new()
## Reference to TIUpgrade 02.
@onready var u_02_fishbone_shards_boost : TIU02FishboneShardsBoost = TIU02FishboneShardsBoost.new()
## Reference to CCUpgrade 03.
@onready var u_03_unlock_kraken_brain : TIU03UnlockKrakenBrain = TIU03UnlockKrakenBrain.new()

## Returns all TIUpgrades.
func get_all_upgrades() -> Array[Upgrade]:
	return [
		u_01_fishbone_shard_generation,
		u_02_fishbone_shards_boost,
		u_03_unlock_kraken_brain,
	]


func get_all_unlocked_upgrades() -> Array[Upgrade]:
	var list : Array[Upgrade] = []
	for upgrade : Upgrade in get_all_upgrades():
		if upgrade.is_unlocked():
			list.append(upgrade)
			
	return list
