class_name ViewTidalInstinct
extends View
## View displaying the upgrades purchasable with Tidal Instinct.

@export var tiu_area : Control

@export var compo_upgrade_scene : PackedScene

## Initialize visibility.
func _ready() -> void:
	super()
	visible = false
	initialize_upgrades()
	HandlerTIUpgrades.ref.upgrade_unlocked.connect(_on_upgrade_unlocked)



func initialize_upgrades() -> void:
	var upgrades : Array[Upgrade] = HandlerTIUpgrades.ref.get_all_unlocked_upgrades()
	
	if upgrades.size() == 0:
		return
		
	for upgrade : Upgrade in upgrades:
		var upgrade_node : CompoUpgrade = compo_upgrade_scene.instantiate() as CompoUpgrade
		
		upgrade_node.upgrade = upgrade
		
		tiu_area.add_child(upgrade_node)
		
## Triggered when an upgrade unlocks. Regenerate the upgrade nodes.	
func _on_upgrade_unlocked(_upgrade : Upgrade) -> void:
	for child : Node in tiu_area.get_children():
		child.queue_free()
	initialize_upgrades()
