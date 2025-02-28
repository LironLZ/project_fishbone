class_name LabelFishboneShards
extends Label
## Displays the current amount of fishbone shards.



## Connecting signals.
func _ready() -> void:
	update_text()
	HandlerFishboneShards.ref.fishbone_shards_created.connect(update_text)
	HandlerFishboneShards.ref.fishbone_shards_consumed.connect(update_text)
	
## Updates the text to reflect the current amount of fishbone shards
func update_text(_quantity : int = -1) -> void:
	if HandlerFishboneShards.ref.fishbone_shards():
		text = "Fishbone Shards : %s" %HandlerFishboneShards.ref.fishbone_shards()

	else:
		text = ""
