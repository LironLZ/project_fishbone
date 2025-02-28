class_name HandlerNautilusGem
extends Node
## Manages Nautilus Gem and related signals.

## Singleton reference.
static var ref : HandlerNautilusGem


## Singleton check.
func _enter_tree() -> void:
	if not ref:
		ref = self
		return
		
	queue_free()
	
	
signal nautilus_gem_created(quantity : int)
signal nautilus_gem_consumed(quantity : int)


## Returns the current amount of Nautilus Gem available. 
func nautilus_gem() -> int: 
	return Game.ref.data.nautilus_gem
	
	
## Create a specific amount of Nautilus Gem. 
func create_nautilus_gem(quantity : int) -> void:
	Game.ref.data.nautilus_gem += quantity
	
	nautilus_gem_created.emit(quantity)
	
	
## Consume a specific amount of Nautilus Gem. 
func consume_nautilus_gem(quantity : int) -> Error:
	if quantity > Game.ref.data.nautilus_gem:
		return Error.FAILED
		
	Game.ref.data.nautilus_gem -= quantity
	nautilus_gem_consumed.emit(quantity)
	
	return Error.OK
	
	
