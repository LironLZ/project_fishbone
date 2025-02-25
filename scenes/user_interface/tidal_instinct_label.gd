class_name LabelTidalInstinct
extends Label
## Displays the current amount of tidal instinct available.



## Connecting signals.
func _ready() -> void:
	update_text()
	HandlerTidalInstinct.ref.tidal_instinct_created.connect(update_text)
	HandlerTidalInstinct.ref.tidal_instinct_consumed.connect(update_text)
	
## Updates the text to reflect the current amount of fishbone shards
func update_text(_quantity : int = -1) -> void:
	text = "Tidal Instinct : %s" %HandlerTidalInstinct.ref.tidal_instinct()
