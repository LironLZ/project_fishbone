class_name PrototypeGenerator
extends View
## Generator prototype creating fishbone shards every second.

## Reference to the button starting the generation.
@export var button : Button
## Reference to the timer.
@export var timer : Timer

## Initialize visibility at launch.
func _ready() -> void:
	super()
	visible = true  ## Ensure this view is visible at game launch

## Creates fishbone shards and stores it.
func create_fishbone_shards() -> void:
	HandlerFishboneShards.ref.create_fishbone_shards(1)

## Start the timer and disable the button.
func begin_generating_fishbone_shards() -> void:
	timer.start()
	button.disabled = true

## Triggered when the "begin generating" button is pressed.
func _on_button_pressed() -> void:
	begin_generating_fishbone_shards()

## Triggered when the timer times out.
func _on_timer_timeout() -> void:
	create_fishbone_shards()
