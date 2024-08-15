class_name PrototypeClicker
extends View
## A clicker prototype harvesting compost

## Initialize the label at launch
func _ready() -> void:
	super()
	visible = false

## Harvest 1 compost.
func harvest_compost() -> void:
	HandlerCompost.ref.triggered_clicker()

## Triggered when haravest compost button is pressed
func _on_button_pressed() -> void:
	harvest_compost()
