class_name ViewOcean
extends View
## Main view of the game displaying Ocean related information.


## Text to display on launch on a new game.
@export var intro_text : Label
## Main content to display once the player has created the Ocean.
@export var main_content : MarginContainer


func _ready() -> void:
	super()
	_initialize_view()
	
## Displays the relevant content based on TIU01 purchase status.
func _initialize_view() -> void:
	if not Game.ref.data.ti_upgrades.u_01_fishbone_shards_generation_level:
		intro_text.visible = true
		main_content.visible = false
		
		HandlerTIUpgrades.ref.u_01_fishbone_shard_generation.leveled_up.connect(_on_tiu01_level_up)
		
	else:
		intro_text.visible = false
		main_content.visible = true


## Wait for TIU01 to be bought. Displays the mains content & hide intro text.
func _on_tiu01_level_up() -> void:
	intro_text.visible = false
	main_content.visible = true
	
	HandlerTIUpgrades.ref.u_01_fishbone_shard_generation.leveled_up.disconnect(_on_tiu01_level_up)
