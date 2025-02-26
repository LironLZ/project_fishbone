extends LinkButton

## Check if the player has unlocked Deep Seas. 
func _ready() -> void:
	if Game.ref.data.ti_upgrades.u_03_unlock_deep_seas:
		visible = true
		
	else:
		visible = false
		HandlerTIUpgrades.ref.u_03_unlock_deep_seas.leveled_up.connect(_on_tiu03_level_up)
	
## Triggered when TIU03 levels up.
## Makes the link visible.
func _on_tiu03_level_up() -> void:
	visible = true
	HandlerTIUpgrades.ref.u_03_unlock_deep_seas.leveled_up.disconnect(_on_tiu03_level_up)
