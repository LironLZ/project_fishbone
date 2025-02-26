class_name HandlerFishboneShards
extends Node
## Manages

## Singleton reference.
static var ref : HandlerFishboneShards



func _ready() -> void:
	_singleton_check()


## Singleton check.
func _singleton_check() -> void:
	if not ref:
		ref = self
		return
	queue_free()

## Emitted when fishbone shards have been created.
signal fishbone_shards_created(quantity : int)
## Emitted when fishbone shards have been consumed
signal fishbone_shards_consumed(quantity : int)

## Returns the current amount of fishbone shards available.
func fishbone_shards() -> int:
	return Game.ref.data.fishbone_shards
	
## Create a specific amount of fishbone shards.
func create_fishbone_shards(quantity : int) -> void:
	Game.ref.data.fishbone_shards += quantity
	Game.ref.data.ocean.fishbone_shards += quantity
	fishbone_shards_created.emit(quantity)
	
## Consume a specific amount of fishbone shards.	
func consume_fishbone_shards(quantity : int) -> Error:
	if quantity > Game.ref.data.fishbone_shards:
		return Error.FAILED
	
	
	Game.ref.data.fishbone_shards -= quantity
	fishbone_shards_consumed.emit(quantity)
		
	return Error.OK
	
