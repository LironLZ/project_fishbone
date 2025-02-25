class_name Data
extends Resource
## Contain data to save and load.

## Current amount of fishbone shards avaialable
@export var fishbone_shards : int = 0
## Current amount of tidal instinct avialable.
@export var tidal_instinct : int = 1
## Upgrade 01 Clicker Upgrade level.
@export var up_01_level : int = 0

## Contains TIUpgrades data to save & load.
@export var ti_upgrades : DataTIUpgrades = DataTIUpgrades.new()
