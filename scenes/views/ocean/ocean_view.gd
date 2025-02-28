class_name ViewOcean
extends View
## Main view of the game displaying Ocean-related information.

## Text to display on launch on a new game.
@export var intro_text: Label
## Main content to display once the player has created the Ocean.
@export var main_content: MarginContainer
## The clickable fish button.
@export var fish_clicker: TextureButton
## Label to display the number of Fishbone Shards.
@export var fishbone_shards_label: Label

func _ready() -> void:
	super()
	_initialize_view()
	_update_fishbone_shards_label()
	
	# Connect the fish click event
	if fish_clicker:
		fish_clicker.pressed.connect(_on_fish_clicked)

## Displays the relevant content based on TIU01 purchase status.
func _initialize_view() -> void:
	if not Game.ref.data.ti_upgrades.u_01_fishbone_shards_generation_level:
		intro_text.visible = true
		main_content.visible = false
		HandlerTIUpgrades.ref.u_01_fishbone_shard_generation.leveled_up.connect(_on_tiu01_level_up)
	else:
		intro_text.visible = false
		main_content.visible = true

## Wait for TIU01 to be bought. Displays the main content & hides intro text.
func _on_tiu01_level_up() -> void:
	intro_text.visible = false
	main_content.visible = true
	HandlerTIUpgrades.ref.u_01_fishbone_shard_generation.leveled_up.disconnect(_on_tiu01_level_up)

## Called when the fish button is clicked.
func _on_fish_clicked() -> void:
	Game.ref.data.fishbone_shards += 1
	_update_fishbone_shards_label()

## Updates the label displaying the number of Fishbone Shards.
func _update_fishbone_shards_label() -> void:
	if fishbone_shards_label:
		fishbone_shards_label.text = "Fishbone Shards: " + str(Game.ref.data.fishbone_shards)
