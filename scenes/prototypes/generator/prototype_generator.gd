class_name PrototypeGenerator
extends Control
## Generator prototype creating stardust every seconds

## Reference to label to display current compost
@export var label : Label
## Reference to button to start harvesting
@export var button : Button
## Referenct to timer
@export var timer : Timer

## Current amount of compost in storage
var compost : int = 0

## Initialize the label
func _ready():
	update_label_text()

## Harvest compost and store it.
func harvest_compost() -> void:
	compost += 1
	update_label_text()
	
## Updates the label text to match the current amount of stardust in storage
func update_label_text() -> void:
	label.text = "Compost : %s" %compost

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
	
