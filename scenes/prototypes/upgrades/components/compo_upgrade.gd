class_name CompoUpgrade
extends Control
## Component displaying an upgrade.

## Reference to the title label
@export var label_title : Label
## Reference to the rich text label description
@export var label_description : RichTextLabel
## Reference to the purchase button
@export var button : Button

## Upgrade to display.
var upgrade : Up01ClickerUpgrade

func _ready() -> void:
	upgrade = Up01ClickerUpgrade.new()
	## Update all labels on start/ready
	update_label_title()
	update_label_description()
	update_button()
	## Connect handlers to update_button function
	HandlerCompost.ref.compost_harvested.connect(update_button)
	HandlerCompost.ref.compost_consumed.connect(update_button)
	upgrade.leveled_up.connect(update_label_title)
	## Include description just to be sure
	upgrade.leveled_up.connect(update_label_description)
	upgrade.leveled_up.connect(update_button)

## Upgrades the title of the upgrade
func update_label_title() -> void:
	var text : String = upgrade.title + " (%s)" %upgrade.level
	label_title.text = text

func update_label_description() -> void:
	label_description.text = upgrade.description()

## Updates the button availability
func update_button(_quantity : int = -1) -> void:
	if upgrade.can_afford():
		button.disabled = false
		return
	button.disabled = true

## Triggered when the purchase button is pressed
func _on_purchase_button_pressed() -> void:
	upgrade.level_up()
