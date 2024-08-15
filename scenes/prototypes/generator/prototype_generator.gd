class_name PrototypeGenerator
extends View
## Generator prototype creating stardust every seconds

## Reference to button to start harvesting
@export var button : Button
## Referenct to timer
@export var timer : Timer

## Initialize the label
func _ready():
	super()
	visible = true

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
