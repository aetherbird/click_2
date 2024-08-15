class_name PrototypeClicker
extends Control
## A clicker prototype harvesting compost

## Reference to the label displaying the current amount of compost harvested
@export var label : Label
## Reference to the user interface
@export var user_interface : UserInterface
## Setup view for signals, view reference
@export var view : UserInterface.Views

## Initialize the label at launch
func _ready() -> void:
	update_label_text()
	visible = false
	user_interface.navigation_requested.connect(_on_navigation_request)

## temp function to update label every frame
func _process(_delta: float) -> void:
	update_label_text()

## Harvest 1 compost.
func harvest_compost() -> void:
	HandlerCompost.ref.harvest_compost(1)

## Update the text of the label to reflect the change in the compost
func update_label_text() -> void:
	label.text = "Compost : %s" %Game.ref.data.compost

## Triggered when haravest compost button is pressed
func _on_button_pressed() -> void:
	harvest_compost()

## Watch for navigation requests and react accordingly
func _on_navigation_request(requested_view : UserInterface.Views ) -> void:
	if requested_view == view:
		visible = true
		return
	visible = false
