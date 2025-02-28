class_name CompoDeepSeas
extends VBoxContainer
## Displays the information of a Deep Sea.


## References the label displaying the name.
@export var label_name : Label
## References the label displaying the composition.
@export var label_composition : RichTextLabel
## References the slider managing the Fishbone Shards Attraction.
@export var attraction_slider : HSlider
## References the slider managaing nautilus gem release.
@export var release_slider : HSlider

## References the Deep Sea to display.
var deep_seas : DeepSeas


func _ready() -> void:
	update_component()
	deep_seas.composition_updated.connect(update_label_composition)

## Update all the nodes of the component.
func update_component() -> void:
	update_label_name()
	update_label_composition()
	update_attraction_slider()
	
	
	
func update_label_name() -> void:
	label_name.text = deep_seas.given_name
	
	
func update_label_composition() -> void:
	var text : String = "Fishbone Shards :  %s" %deep_seas.fishbone_shards
	if deep_seas.nautilus_gem:
		text += "\nNautilus Gem : %s" %deep_seas.nautilus_gem
		
	label_composition.text = text
	
func update_attraction_slider() -> void:
	attraction_slider.min_value = HandlerDeepSeas.ref.min_attraction_value
	attraction_slider.max_value = HandlerDeepSeas.ref.max_attraction_value
	attraction_slider.value = deep_seas.attraction_value
	
	
func update_release_slider() -> void:
	release_slider.min_value = HandlerDeepSeas.ref.min_release_value
	release_slider.max_value = HandlerDeepSeas.ref.max_release_value
	release_slider.value = deep_seas.release_value
	
	


## Triggered when the Attraction Slider value is changed.
func _on_attraction_slider_value_changed(value: float) -> void:
	HandlerDeepSeas.ref.update_deep_seas_fishbone_shards_attraction_value(deep_seas.data_index, int(value))

## Triggered when the Release Slider value is changed.
func _on_release_slider_value_changed(value: float) -> void:
	HandlerDeepSeas.ref.update_deep_seas_release_value(deep_seas.data_index, int(value))
