
extends VBoxContainer
## Displays the Active effects of the Ocean.

## Reference to the label displaying the current Fishbone Shards per second.
@export var fishbone_shards_per_second : RichTextLabel


func _ready() -> void:
	_connect_signals()
	_update_fishbone_shards_per_second()



func _connect_signals() -> void:
	HandlerFishboneShardsGenerator.ref.generator_power_calculated.connect(_on_fishbone_shards_generator_power_calculated)

## Updates the fishbone shards per second display.
func _update_fishbone_shards_per_second() -> void:
	var text : String = "[b]Fishbone Shards/s :[/b] %s" %HandlerFishboneShardsGenerator.ref.generator_power
	fishbone_shards_per_second.text = text
	
	
## Triggered when the fishbone shards generator power was calculated.
func _on_fishbone_shards_generator_power_calculated() -> void:
	_update_fishbone_shards_per_second()
