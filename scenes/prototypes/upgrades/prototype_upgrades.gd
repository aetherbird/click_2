class_name PrototypeUpgrades
extends Control
## Prototype of a view displaying upgrades.

## Reference to the user interface
@export var user_interface : UserInterface
## Setup view for signals, view reference
@export var view : UserInterface.Views

## Initialize the label at launch
func _ready() -> void:
	visible = false
	user_interface.navigation_requested.connect(_on_navigation_request)
	
	## Watch for navigation requests and react accordingly
func _on_navigation_request(requested_view : UserInterface.Views ) -> void:
	if requested_view == view:
		visible = true
		return
	visible = false
