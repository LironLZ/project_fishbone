extends Control

@onready var upgrade_panel = $UpgradePanel
@onready var tween = get_tree().create_tween()

var is_expanded = false

func _ready():
	upgrade_panel.visible = false  # Hide the panel initially

func _on_toolbar_button_pressed():
	if is_expanded:
		collapse_menu()
	else:
		expand_menu()

func expand_menu():
	is_expanded = true
	upgrade_panel.visible = true
	tween.tween_property(upgrade_panel, "position", Vector2(1600, 800), 0.3).set_trans(Tween.TRANS_QUAD)

func collapse_menu():
	is_expanded = false
	tween.tween_property(upgrade_panel, "position", Vector2(1800, 800), 0.3).set_trans(Tween.TRANS_QUAD)
	tween.tween_callback(upgrade_panel.hide)


func _on_texture_button_pressed() -> void:
	pass # Replace with function body.
