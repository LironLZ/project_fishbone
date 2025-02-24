class_name PrototypeGenerator
extends Control
## Generator prototype creating fishbone shards every second.




## Reference to the label displaying the current amount of fishbone shards in storage.
@export var label : Label
## Reference to the button starting the generation.
@export var button : Button
## Reference to the timer.
@export var timer : Timer


## Current amount of fishbone shards in storage.
var fishbone_shards : int = 0



##  Initialize the label.
func _ready() -> void:
	update_label_text()
	
	
## Creates fishbone shards and stores it.
func create_fishbone_shards() -> void:
	fishbone_shards += 1
	update_label_text()
	
## Updates the label text to match the current amount of fishbone shards in storage.
func update_label_text() -> void:
	label.text = "Fishbone Shards : %s" %fishbone_shards
	
	
	
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
