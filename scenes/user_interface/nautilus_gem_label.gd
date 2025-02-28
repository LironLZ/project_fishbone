class_name LabelNautilusGem
extends Label
## Displays the current amount of nautilus gems.



## Connecting signals.
func _ready() -> void:
	update_text()
	HandlerNautilusGem.ref.nautilus_gem_created.connect(update_text)
	HandlerNautilusGem.ref.nautilus_gem_consumed.connect(update_text)
	
## Updates the text to reflect the current amount of nautilus gems 
func update_text(_quantity : int = -1) -> void:
	if HandlerNautilusGem.ref.nautilus_gem():
		text = "Nautilus Gems : %s" %HandlerNautilusGem.ref.nautilus_gem()
	
	else:
		text = ""
