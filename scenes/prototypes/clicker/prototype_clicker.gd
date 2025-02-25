class_name PrototypeClicker
extends View
## A clicker prototype creating fishbone shards.

## Initialize the label at launch.
func _ready() -> void:
	super()
	visible = false

## Create 1 fishbone shard.
func create_fishbone_shards() -> void:
	HandlerFishboneShards.ref.trigger_clicker()

## Triggered when the create fishbone shards button is pressed.
func _on_button_pressed() -> void:
	create_fishbone_shards()
