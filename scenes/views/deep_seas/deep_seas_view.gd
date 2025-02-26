class_name ViewDeepSeas
extends View
## View displaying & managing Deep Seas.


## Area to add deep sea components to.
@export var main_list : VBoxContainer
## References the scene of the deep sea component.
@export var scene_deep_seas : PackedScene


## Reference to the Deep Seas Handler.
@onready var handler : HandlerDeepSeas = HandlerDeepSeas.ref


## Initialize View settings.
func _ready() -> void:
	super()
	_generate_deep_seas()
	handler.deep_seas_created.connect(_generate_newest_deep_seas)

## Asks the handler to create a new deep sea.
func _on_button_pressed() -> void:
	handler.create_deep_seas()
	

## Generate all deep seas from the handler.
func _generate_deep_seas() -> void:
	if handler.deep_seas.size() == 0:
		return
		
	for deep_seas : DeepSeas in handler.deep_seas:
		var new_node : CompoDeepSeas = scene_deep_seas.instantiate() as CompoDeepSeas
		new_node.deep_seas = deep_seas
		main_list.add_child(new_node)


## Generate the newest node.		
func _generate_newest_deep_seas() -> void:
	var table_size : int = handler.deep_seas.size()
	
	var new_node : CompoDeepSeas = scene_deep_seas.instantiate() as CompoDeepSeas
	new_node.deep_seas = handler.deep_seas[table_size -1]
	main_list.add_child(new_node)


	
