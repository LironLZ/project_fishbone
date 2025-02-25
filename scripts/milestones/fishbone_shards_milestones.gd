class_name MilestoneFishboneShards
extends Node
## Generates Tidal Instinct every X amount of Fishbone Shards being created.



## Amount of fishbone shards required to create the next tidal instinct.
var fishbone_shards_goal : int = -1
## Amount of fishbone shards generated in the last milestone.
var fishbone_shards_progress : int = -1

## Reference to the ocean data.
var ocean : DataOcean

func _init() -> void:
	ocean = Game.ref.data.ocean
	HandlerFishboneShards.ref.fishbone_shards_created.connect(_on_fishbone_shards_created)
	initialize_new_milestone(ocean.fishbone_shards_milestone_progress)

## Initialize a new milestone after the previous one is completed.
func initialize_new_milestone(transferred_progress : int = 0) -> void:
	if ocean.tidal_instinct == 0:
		fishbone_shards_goal = 4
		
	else:
		fishbone_shards_goal = ocean.tidal_instinct * 8
		
	fishbone_shards_progress = 0
	ocean.fishbone_shards_milestone_progress = fishbone_shards_progress
## Checks for milestone completion.
func check_for_completion() -> void:
	if fishbone_shards_progress < fishbone_shards_goal:
		return
		
	var fishbone_shards_excess : int = fishbone_shards_progress - fishbone_shards_goal
	
	HandlerTidalInstinct.ref.create_tidal_instinct(1)
	
	initialize_new_milestone(fishbone_shards_excess)
	check_for_completion()
	
## Triggered when fishbone shards are created. Progresses the milestone.
func _on_fishbone_shards_created(quantity : int) -> void:
	fishbone_shards_progress += quantity
	ocean.fishbone_shards_milestone_progress = fishbone_shards_progress

	check_for_completion()
