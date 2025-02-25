class_name HandlerTidalInstinct
extends Node
## Manages Tidal Instinct and related signals.

## Singleton reference.
static var ref : HandlerTidalInstinct


## Singleton check.
func _enter_tree() -> void:
	if not ref:
		ref = self
		return
	queue_free()
	
## Emitted when Tidal Instinct is created.
signal tidal_instinct_created(quantity : int)
## Emitted when Tidal Instinct is consumed.
signal tidal_instinct_consumed(quantity : int)	
## Node managing fishbone shards milestones, creating tidal instinct.
@onready var fishbone_shards_milestone : MilestoneFishboneShards = MilestoneFishboneShards.new()

## Get the current amount of Tidal Instinct.
func tidal_instinct() -> int:
	return Game.ref.data.tidal_instinct
	
	
## Create a specific amount of Tidal Instinct.
func create_tidal_instinct(quantity : int) -> void:
	Game.ref.data.tidal_instinct += quantity
	Game.ref.data.ocean.tidal_instinct += quantity
	tidal_instinct_created.emit(quantity)
	
## Consume a specific amount of Tidal Instinct.
func consume_tidal_instinct(quantity : int) -> Error:
	if quantity > Game.ref.data.tidal_instinct:
		return Error.FAILED
		
	Game.ref.data.tidal_instinct -= quantity
	tidal_instinct_consumed.emit(quantity)
		
	return Error.OK
