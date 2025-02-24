class_name PrototypeGenerator
extends Control
## Generator prototype creating fishbone shards every second.




## Reference to the button starting the generation.
@export var button : Button
## Reference to the timer.
@export var timer : Timer
## View reference.
@export var view : UserInterface.Views
## Reference to the user interface.
@export var user_interface : UserInterface





##  Initialize the label.
func _ready() -> void:
	
	visible = true
	
	user_interface.navigation_requested.connect(_on_navigation_request)
	
	
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

## Watch for navigation requests and react accordingly.
func _on_navigation_request(requested_view : UserInterface.Views) -> void:
	if requested_view == view:
		visible = true
		return
		
	visible = false
