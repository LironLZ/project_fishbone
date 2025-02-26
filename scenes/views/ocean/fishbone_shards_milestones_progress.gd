extends ProgressBar
## Displays the current progression toward next milestone.

## Reference to the label displaying numbered progress.
@export var label : Label

## Reference to the milestone node.
@onready var milestone : MilestoneFishboneShards = HandlerTidalInstinct.ref.fishbone_shards_milestone

func _ready() -> void:
	_connect_signals()
	
func _connect_signals() -> void:
	milestone.progressed.connect(_on_milestone_change)
	milestone.new_milestone_created.connect(_on_milestone_change)
	
	
func _update_progress() -> void:
	max_value = milestone.fishbone_shards_goal
	value = milestone.fishbone_shards_progress
	
	label.text = "%s / %s" %[milestone.fishbone_shards_progress, milestone.fishbone_shards_goal]

## Triggered when a new milestone is created or when the current milestone progresses.
func _on_milestone_change() -> void:
	_update_progress()
