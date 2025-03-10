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
## Amount of Nautilus Gem inside the deep sea.
var nautilus_gem : int = 0

## Amount of fishbone shards the deep seas attract every second.
var attraction_value : int = 1
## Amount of Nautilus Gem being released
var release_value : int = 1

## Modifier applied to fishbone shards generation.
var effect_fishbone_shards_generation : int = 0

## Tries to consume fishbone shards.
func attract_fishbone_shards() -> void:
	var error : Error = HandlerFishboneShards.ref.consume_fishbone_shards(attraction_value)
	
	if error:
		return
		
	fishbone_shards += attraction_value
	Game.ref.data.deep_seas[data_index].fishbone_shards = fishbone_shards
	
	composition_updated.emit()

## Transforms Fishbone Shards into Nautilus Gem.
func refine_fishbone_shards() -> void:
	var nautilus_gem_to_create : int = -1
	if fishbone_shards >= 100:
		var error : Error = consume_fishbone_shards(9)
		
		if error:
			return
			
		nautilus_gem_to_create = 5
		
		
	elif fishbone_shards >= 25:
		var error : Error = consume_fishbone_shards(3)
		
		if error:
			return
		
		nautilus_gem_to_create = 2
	
	if nautilus_gem_to_create != -1:
		nautilus_gem += nautilus_gem_to_create
		Game.ref.data.ocean.nautilus_gem += nautilus_gem_to_create
		Game.ref.data.deep_seas[data_index].nautilus_gem = nautilus_gem
		
		calculate_effect_fishbone_shards_generation()
		composition_updated.emit()
		
## Tries to consume a certain amount of Fishbone Shards.	
func consume_fishbone_shards(quantity : int) -> Error:
	if fishbone_shards >= quantity:
		fishbone_shards -= quantity
		Game.ref.data.deep_seas[data_index].fishbone_shards = fishbone_shards
		
		return Error.OK
		
	return Error.FAILED
	
## Tries to consume a certain amount of Nautilus Gem
func consume_nautilus_gem(quantity : int) -> Error:
	if nautilus_gem >= quantity:
		nautilus_gem -= quantity
		Game.ref.data.deep_seas[data_index].nautilus_gem = nautilus_gem
		
		calculate_effect_fishbone_shards_generation()
		
		return Error.OK
		
	return Error.FAILED
	
## Consume Nautilus Gems from the Deep Sea to release it in the ocean.
func release_nautilus_gem() -> void:
	var quantity : int = -1
	if release_value > nautilus_gem:
		quantity = nautilus_gem
		
	else:
		quantity = release_value
		
	var error : Error = consume_nautilus_gem(quantity)
	
	if error:
		return
		
	HandlerNautilusGem.ref.create_nautilus_gem(quantity)
	
	
## Calculate the potency of fishbone shards generation effect.
func calculate_effect_fishbone_shards_generation() -> void:
	var old_effect : int = effect_fishbone_shards_generation
	
	if nautilus_gem >= 25:
		effect_fishbone_shards_generation = 1
		
	if nautilus_gem >= 100:
		effect_fishbone_shards_generation = 2
	
	if effect_fishbone_shards_generation != old_effect:
		HandlerDeepSeas.ref.calculate_deep_seas_effect_fishbone_shards_generation()
		
		
		
		
## Triggered when the Deep Seas timer times out.
func _on_deep_seas_timer_timeout() -> void:
	attract_fishbone_shards()
	refine_fishbone_shards()
	release_nautilus_gem()
