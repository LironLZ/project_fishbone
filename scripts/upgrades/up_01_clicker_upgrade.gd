class_name Up01ClickerUpgrade
extends Node
## Upgrade 01 - Increases Fishbone shards created by the clicker.


## Emitted when the upgrade has leveled up.
signal leveled_up

## Level of the upgrade.
var level : int 
## Title or "name" of the upgrade.
var title : String = "Clicker Upgrade"
## Base cost of the upgrade.
var base_cost : int = 5
## Current cost of the upgrade
var cost : int

## Load data.
func _init() -> void:
	level = Game.ref.data.up_01_level
	calculate_cost()

## Returns the description containing effects and cost.
func description() -> String:
	var _description : String = "Increases the amount of fishbone shards created by the Clicker."
	_description += "\nEffects : +1 Fishbone Shards / Level"
	_description += "\nCost : %s" % cost

	return _description

## Returns the current cost based on level and base cost
func calculate_cost() -> void:
	cost = int(base_cost * pow(1.5, level))

## Returns whehter or not the player can afford buying the upgrade.
func can_afford() -> bool:
	if HandlerFishboneShards.ref.fishbone_shards() >= cost:
		return true
		
		
	return false
	
## Consumes fishbone shards to level up.
func level_up() -> void:
	var error : Error = HandlerFishboneShards.ref.consume_fishbone_shards(cost)
	
	if not error:
		level += 1
		Game.ref.data.up_01_level = level
		
		calculate_cost()
		leveled_up.emit()
