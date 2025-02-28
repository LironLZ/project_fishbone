class_name HandlerDeepSeas
extends Node
## Manages Deep Seas.


## Singleton reference.
static var ref : HandlerDeepSeas


## Singleton check.
func _enter_tree() -> void:
	if not ref:
		ref = self
		return
	queue_free()
	
signal deep_seas_created
	
## Reference to the fishbone shards consumption timer.
@export var timer : Timer
	
## List of Deep Seas.
var deep_seas : Array[DeepSeas] = []
## Maximum amount of deep seas the player can create.
var max_deep_seas_count : int = 1

## Minimum attraction value Deep seas can have.
var min_attraction_value : int = 1
## Maxiumum Attraction value Deep Seas can have.
var max_attraction_value : int = 5 
## Minimum release value deep seas can have.
var min_release_value : int = 1
## Maximum release value Deep seas can have.
var max_release_value : int = 5

## Load Deep Seas.
func _ready() -> void:
	load_deep_seas()
	
	
## Load Deep Seas from Data.
func load_deep_seas() -> void:
	if Game.ref.data.deep_seas.size() == 0:
		return
		
	deep_seas = []
	
	var index : int = 0
	
	for _deep_seas: DataDeepSeas in Game.ref.data.deep_seas:
		var new_deep_seas : DeepSeas = DeepSeas.new()
		new_deep_seas.name = _deep_seas.name
		
		new_deep_seas.fishbone_shards = _deep_seas.fishbone_shards
		new_deep_seas.nautilus_gem = _deep_seas.nautilus_gem
		
		new_deep_seas.attraction_value = _deep_seas.attraction_value
		new_deep_seas.release_value = _deep_seas.release_value
		
		new_deep_seas.data_index = index
		
		timer.timeout.connect(new_deep_seas._on_deep_seas_timer_timeout)
		
		deep_seas.append(new_deep_seas)
		

## Returns the full list of Deep Seas.
func get_all_deep_seas() -> Array:
	return deep_seas
	
	
## Create a new deep sea and add it to the list.
func create_deep_seas() -> Error:
	if deep_seas.size() >= max_deep_seas_count:
		return Error.FAILED
	var new_deep_seas : DeepSeas = DeepSeas.new()
	
	new_deep_seas.data_index = deep_seas.size()
	
	timer.timeout.connect(new_deep_seas._on_deep_seas_timer_timeout)
	
	deep_seas.append(new_deep_seas)
	
	var data_deep_seas : DataDeepSeas = DataDeepSeas.new()
	data_deep_seas.name = new_deep_seas.given_name
	
	data_deep_seas.fishbone_shards = new_deep_seas.fishbone_shards
	data_deep_seas.nautilus_gem = new_deep_seas.nautilus_gem
	
	data_deep_seas.attraction_value = new_deep_seas.attraction_value
	data_deep_seas.release_value = new_deep_seas.release_value
	
	Game.ref.data.deep_seas.append(data_deep_seas)
	
	deep_seas_created.emit()
	return Error.OK
	
## Changes the fishbone shards consumption value of a single Deep Sea.
func update_deep_seas_fishbone_shards_attraction_value(index : int, value : int) -> void:
	deep_seas[index].attraction_value = value
	Game.ref.data.deep_seas[index].attraction_value = value
	

## Changes the Nautilus Gem release value of a single Deep Sea.
func update_deep_seas_release_value(index : int, value : int) -> void:
	deep_seas[index].release_value = value 
	Game.ref.data.deep_seas[index].release_value = value
