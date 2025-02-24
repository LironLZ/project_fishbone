class_name PrototypeClicker
extends Control
## A clicker prototype creating fishbone shards.

## View reference.
@export var view : UserInterface.Views
## Reference to the user interface.
@export var user_interface : UserInterface



## Initialize the label at launch.
func _ready() -> void:
	visible = false
	
	user_interface.navigation_requested.connect(_on_navigation_request)
	
	


## Create 1 fishbone shards.
func create_fishbone_shards() -> void:
	HandlerFishboneShards.ref.create_fishbone_shards(1)
	

	
## Triggered when the create fishbone shards button is pressed.
func _on_button_pressed() -> void:
	create_fishbone_shards()
	
## Watch for navigation requests and react accordingly.
func _on_navigation_request(requested_view : UserInterface.Views) -> void:
	if requested_view == view:
		visible = true
		return
		
	visible = false
