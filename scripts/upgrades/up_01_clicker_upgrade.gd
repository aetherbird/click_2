class_name Up01ClickerUpgrade
## Upgrade 01 - Increases compost harvested by the clicker.

## Level of the upgrade
var level : int = 0
## Title/name of upgrade
var title : String = "Clicker Upgrade"
## Base cost of the upgrade
var base_cost : int = 0

## Returns the description containing effects and cost.
func description() -> String:
	## Description containing effects and cost
	var _description : String = "Increases the amount of compost harvested by the Clicker."
	_description += "\nEffects : +1 Compost / Level"
	_description += "\nCost : %s" %cost()
	return description()

## Returns the current cost based on level and base cost. 
func cost() -> int:
	return int(base_cost * pow(1.5, level))

## Returns whether or not player can afford the upgrade
func can_afford() -> bool:
	if HandlerCompost.ref.compost() >= cost():
		return true
	return false
