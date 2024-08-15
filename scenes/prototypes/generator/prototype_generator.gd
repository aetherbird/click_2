class_name PrototypeGenerator
extends Control
## Generator prototype creating stardust every seconds

## Reference to button to start harvesting
@export var button : Button
## Referenct to timer
@export var timer : Timer
## Reference to the user interface
@export var user_interface : UserInterface
## Setup view for signals, view reference
@export var view : UserInterface.Views

## Initialize the label
func _ready():
	visible = true
	user_interface.navigation_requested.connect(_on_navigation_request)

## Harvest compost and store it.
func harvest_compost() -> void:
	HandlerCompost.ref.harvest_compost(1)

## Start timer and disable button
func begin_harvesting_compost() -> void:
	timer.start()
	button.disabled = true

## Triggered when the "begin harvesting" button is pressed
func _on_button_pressed() -> void:
	begin_harvesting_compost()

## Triggered when the timer times out.
func _on_timer_timeout():
	harvest_compost()
	
func _on_user_interface_navigation_requested(view):
	pass # Replace with function body.

## Watch for navigation requests and react accordingly
func _on_navigation_request(requested_view : UserInterface.Views ) -> void:
	if requested_view == view:
		visible = true
		return
	visible = false
