class_name UserInterface
extends Control
## Main class controlling the user interface.


## List of views.
enum Views {
	PROTOTYPE_GENERATOR,
	PROTOTYPE_CLICKER,
	PROTOTYPE_UPGRADES,
	TIDAL_INSTINCT, 
}

## Emitted when something requested navigation. Includes the view target.
signal navigation_requested(view : Views)



## Triggered when the prototype generator link is clicked
func _on_prototype_generator_link_pressed() -> void:
	navigation_requested.emit(Views.PROTOTYPE_GENERATOR)

## Triggered when the prototype clicker link is clicked.
func _on_prototype_clicker_link_pressed() -> void:
	navigation_requested.emit(Views.PROTOTYPE_CLICKER)

## Triggered when the prototype upgrades link is clicked.
func _on_prototype_upgrades_link_pressed() -> void:
	navigation_requested.emit(Views.PROTOTYPE_UPGRADES)

## Triggered when the Tidal Instinct link is clicked.
func _on_tidal_instinct_link_pressed() -> void:
	navigation_requested.emit(Views.TIDAL_INSTINCT)
