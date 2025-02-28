
extends VBoxContainer
## Displays the Active effects of the Ocean.

## Reference to the label displaying the current Fishbone Shards per second.
@export var fishbone_shards_per_second : RichTextLabel


func _ready() -> void:
	_connect_signals()
	_update_active_effects()



func _connect_signals() -> void:
	HandlerFishboneShardsGenerator.ref.generator_power_calculated.connect(_on_fishbone_shards_generator_power_calculated)
	HandlerDeepSeas.ref.effect_fishbone_shards_consumption_updated.connect(_on_effect_deep_seas_fishbone_shards_consumption_updated)

## Updates active effects display.
func _update_active_effects() -> void:
	var text : String = "[b]Fishbone Shards.s⁻¹ :[/b] %s" %HandlerFishboneShardsGenerator.ref.generator_power
	if (HandlerDeepSeas.ref.effect_fishbone_shards_consumed):
		text += "\n[b]Deep Seas Fishbone Shards Consumption.s⁻¹ : [/b] %s" %HandlerDeepSeas.ref.effect_fishbone_shards_consumed
	fishbone_shards_per_second.text = text
	
	
## Triggered when the fishbone shards generator power was calculated.
func _on_fishbone_shards_generator_power_calculated() -> void:
	_update_active_effects()

## Triggered when deep seas fishbone shards consumption is updated.
func _on_effect_deep_seas_fishbone_shards_consumption_updated() -> void:
	_update_active_effects()
