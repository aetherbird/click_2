class_name PrototypeClicker
extends Control
## A clicker prototype harvesting compost

## Reference to the label displaying the current amount of compost harvested
@export var label : Label
## Current amount of compost harvested
var compost : int = 0

## Initialize the label at launch
func _ready() -> void:
	update_label_text()

## Harvest 1 compost.
func harvest_compost() -> void:
	compost += 1
	update_label_text()

## Update the text of the label to reflect the change in the compost
func update_label_text() -> void:
	label.text = "Compost : %s" %compost

## Triggered when haravest compost button is pressed
func _on_button_pressed() -> void:
	harvest_compost()
