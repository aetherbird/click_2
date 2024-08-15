class_name HandlerCompost
extends Node
## Manager compost and related signals

## Singleton reference.
static var ref : HandlerCompost

## Singleton check.
func _enter_tree() -> void:
	if not ref:
		ref = self
		return
	queue_free()

## Emitted when compost is harvested.
signal compost_harvested(quantity : int)
## Emitted when compost is consumed.
signal compost_consumed(quantity : int)

## Returns the amount of compost available
func compost() -> int:
	return Game.ref.data.compost

func harvest_compost(quantity : int) -> void:
	Game.ref.data.compost += quantity
	compost_harvested.emit(quantity)

func consume_compost(quantity : int) -> Error:
	if quantity > Game.ref.data.compost:
		return Error.FAILED
	Game.ref.data.compost -= quantity
	compost_consumed.emit(quantity)
	return Error.OK

## Triggered by the clicker; harvests compost
func triggered_clicker() -> void:
	var quantity : int = 1
	quantity += Game.ref.data.up_01_level
	## Use the function w/ quantity
	harvest_compost(quantity)
