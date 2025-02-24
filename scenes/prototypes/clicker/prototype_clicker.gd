class_name PrototypeClicker
extends Control
## A clicker prototype creating fishbone shards.


## Reference to the label displaying the current amount of fishbone shards created.
@export var label : Label
## Current amount of fishbone shards created.
var fishbone_shards : int = 0 

## Initialize the label at launch.
func _ready() -> void:
	update_label_text()


## Create 1 fishbone shards.
func create_fishbone_shards() -> void:
	fishbone_shards +=1
	update_label_text()
	

## Update the text of the label to reflect a change in fishbone shard amount.
func update_label_text() -> void:
	label.text = "Fishbone Shards : %s" %fishbone_shards
	
	
## Triggered when the create fishbone shards button is pressed.
func _on_button_pressed() -> void:
	create_fishbone_shards()
	
