class_name LabelCompost
extends Label
## Displays the current amount of compst available.  

## Connecting signals!
func _ready() -> void:
	update_text()
	HandlerCompost.ref.compost_harvested.connect(update_text)
	HandlerCompost.ref.compost_consumed.connect(update_text)

## Updates the text to reflect the currect amount of compost
func update_text(_quantity : int = -1) -> void:
	text = "Compost : %s" %HandlerCompost.ref.compost()
