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
		new_deep_seas.fishbone_shards_consumed = _deep_seas.fishbone_shards_consumed
		new_deep_seas.data_index = index
		
		timer.timeout.connect(new_deep_seas._on_consume_fishbone_shards)
		
		deep_seas.append(new_deep_seas)
		

## Returns the full list of Deep Seas.
func get_all_deep_seas() -> Array:
	return deep_seas
	
	
## Create a new deep sea and add it to the list.
func create_deep_seas() -> void:
	var new_deep_seas : DeepSeas = DeepSeas.new()
	new_deep_seas.data_index = deep_seas.size()
	
	timer.timeout.connect(new_deep_seas._on_consume_fishbone_shards)
	
	deep_seas.append(new_deep_seas)
	
	var data_deep_seas : DataDeepSeas = DataDeepSeas.new()
	data_deep_seas.name = new_deep_seas.given_name
	data_deep_seas.fishbone_shards = new_deep_seas.fishbone_shards
	data_deep_seas.fishbone_shards_consumed = new_deep_seas.fishbone_shards_consumed
	Game.ref.data.deep_seas.append(data_deep_seas)
	
	deep_seas_created.emit()
	
	
## Changes the fishbone shards consumption value of a single Deep Sea.
func update_deep_seas_fishbone_shards_consumption_value(index : int, value : int) -> void:
	deep_seas[index].fishbone_shards_consumed = value
	Game.ref.data.deep_seas[index].fishbone_shards_consumed = value
	
	
