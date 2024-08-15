class_name Upgrade
extends Node
## Abstract class defining an upgrade

## Emitted when the upgrade has leveled up
signal leveled_up

## Level of the upgrade
var level : int = -1
## Title/name of upgrade
var title : String = "Title Not Defined"
## Base cost of the upgrade
var base_cost : int = -1
## Current cost of upgrade: cost variable
var cost : int = -1

## Virtual class, must be overwritten[br]
## Returns the description of the upgrade
func description() -> String:
	return "Description not defined"

## Virtual class, must be overwritten[br]
## Returns the current cost based on level and base cost.
func calculate_cost() -> void:
	printerr("calculate_cost() method not defined.")

## Virtual class, must be overwritten[br]
## Returns whether or not player can afford the upgrade
func can_afford() -> bool:
	return false

## Consumes compost to level up
func level_up() -> void:
	printerr("level_up() method not defined.")
