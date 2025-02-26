class_name Data
extends Resource
## Contain data to save and load.

## Current amount of fishbone shards avaialable
@export var fishbone_shards : int = 0
## Current amount of tidal instinct avialable.
@export var tidal_instinct : int = 1


## Contains TIUpgrades data to save & load.
@export var ti_upgrades : DataTIUpgrades = DataTIUpgrades.new()
## Contains Ocean data to save and load.
@export var ocean : DataOcean = DataOcean.new()

## Contains Deep Seas data.
@export var deep_seas : Array[DataDeepSeas] = []
