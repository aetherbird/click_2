class_name Up01ClickerUpgrade
extends Node
## Upgrade 01 - Increases compost harvested by the clicker.

## Emitted when the upgrade has leveled up
signal leveled_up

## Level of the upgrade
var level : int
## Title/name of upgrade
var title : String = "Clicker Upgrade"
## Base cost of the upgrade
var base_cost : int = 5
## Current cost of upgrade: cost variable
var cost : int

## Load data
func _init() -> void:
	level = Game.ref.data.up_01_level
	calculate_cost()

## Returns the description containing effects and cost.
func description() -> String:
	## Description containing effects and cost
	var _description : String = "Increases the amount of compost harvested by the Clicker."
	_description += "\nEffects : +1 Compost / Level"
	_description += "\nCost : %s" %cost
	return _description

## Returns the current cost based on level and base cost. 
func calculate_cost() -> void:
	cost = int(base_cost * pow(1.5, level))

## Returns whether or not player can afford the upgrade
func can_afford() -> bool:
	if HandlerCompost.ref.compost() >= cost:
		return true
	return false

## Consumes compost to level up
func level_up() -> void:
	var error : Error = HandlerCompost.ref.consume_compost(cost)
	if not error:
		level += 1
		Game.ref.data.up_01_level = level
		calculate_cost()
		leveled_up.emit()
