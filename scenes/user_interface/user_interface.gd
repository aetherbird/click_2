class_name UserInterface
extends Control
## Main class controlling the user interface


## List of all views
enum Views {
	PROTOTYPE_GENERATOR,
	PROTOTYPE_CLICKER,
	PROTOTYPE_UPGRADES,
}

## Emitted when something reuqested navigation. Includes the new target.
signal navigation_requested(view : Views)

## Triggered when the prototype generator link is clicked.
func _on_prototype_generator_link_pressed():
	navigation_requested.emit(Views.PROTOTYPE_GENERATOR)

## Triggered when the prototype clicker link is clicked. 
func _on_prototype_clicker_link_pressed():
	navigation_requested.emit(Views.PROTOTYPE_CLICKER)

## Triggered when the prototype upgrades link is clicked. 
func _on_prototype_upgrades_pressed():
	navigation_requested.emit(Views.PROTOTYPE_UPGRADES)
