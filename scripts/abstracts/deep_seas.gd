class_name DeepSeas
extends Node
## Abstract class containing the common features of all Deep Seas.

signal composition_updated

## Name of the Deep Seas.
var given_name : String
## Index of the Deep Seas in Data.
var data_index : int = -1
## Amount of Fishbone Shards inside the Deep Seas.
var fishbone_shards : int = 0
## Amount of fishbone shards the deep seas attract every second.
var fishbone_shards_consumed : int = 1

## Tries to consume fishbone shards.
func _on_consume_fishbone_shards() -> void:
	var error : Error = HandlerFishboneShards.ref.consume_fishbone_shards(fishbone_shards_consumed)
	
	if error:
		return
		
	fishbone_shards += fishbone_shards_consumed
	Game.ref.data.deep_seas[data_index].fishbone_shards = fishbone_shards
	
	composition_updated.emit()
