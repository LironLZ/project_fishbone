class_name CompoDeepSeas
extends VBoxContainer
## Displays the information of a Deep Sea.


## References the label displaying the name.
@export var label_name : Label
## References the label displaying the composition.
@export var label_composition : RichTextLabel
## References the slider managing the consumption.
@export var consumption_slider : HSlider



## References the Deep Sea to display.
var deep_seas : DeepSeas


func _ready() -> void:
	update_component()
	deep_seas.composition_updated.connect(update_label_composition)

## Update all the nodes of the component.
func update_component() -> void:
	update_label_name()
	update_label_composition()
	update_slider()
	
	
	
func update_label_name() -> void:
	label_name.text = deep_seas.given_name
	
	
func update_label_composition() -> void:
	var text : String = "[b]Fishbone Shards : [/b] %s" %deep_seas.fishbone_shards
	label_composition.text = text
	
func update_slider() -> void:
	consumption_slider.max_value = 5
	consumption_slider.value = deep_seas.fishbone_shards_consumed


func _on_h_slider_value_changed(value: float) -> void:
	HandlerDeepSeas.ref.update_deep_seas_fishbone_shards_consumption_value(deep_seas.data_index, int(value))
