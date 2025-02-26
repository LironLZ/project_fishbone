class_name UserInterface
extends Control
## Main class controlling the user interface.


## List of views.
enum Views {
	OCEAN,
	TIDAL_INSTINCT, 
	DEEP_SEAS, 
}

## Emitted when something requested navigation. Includes the view target.
signal navigation_requested(view : Views)


## Navigate to Ocean View on Launch.
func _ready() -> void:
	navigation_requested.emit(Views.OCEAN)


## Triggered when the Tidal Instinct link is clicked.
func _on_tidal_instinct_link_pressed() -> void:
	navigation_requested.emit(Views.TIDAL_INSTINCT)

## Triggered when the Ocean Link Button is clicked.
func _on_ocean_link_pressed() -> void:
	navigation_requested.emit(Views.OCEAN)
	

## Triggered when the Deep Seas Link Button is clicked.
func _on_deep_seas_link_pressed() -> void:
	navigation_requested.emit(Views.DEEP_SEAS)
