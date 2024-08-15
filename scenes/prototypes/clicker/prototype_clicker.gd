class_name PrototypeClicker
extends Control
## A clicker prototype harvesting compost

## Reference to the user interface
@export var user_interface : UserInterface
## Setup view for signals, view reference
@export var view : UserInterface.Views

## Initialize the label at launch
func _ready() -> void:
	visible = false
	user_interface.navigation_requested.connect(_on_navigation_request)

## Harvest 1 compost.
func harvest_compost() -> void:
	HandlerCompost.ref.triggered_clicker()

## Triggered when haravest compost button is pressed
func _on_button_pressed() -> void:
	harvest_compost()

## Watch for navigation requests and react accordingly
func _on_navigation_request(requested_view : UserInterface.Views ) -> void:
	if requested_view == view:
		visible = true
		return
	visible = false
