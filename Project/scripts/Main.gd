extends Node2D

var eq_slot = [0,0,0,0,0]
var player_control = true
var changing_eq:int
var delete_eq
var is_equipment_change = false
var is_property_change = false

# Called when the node enters the scene tree for the first time.
func _ready():
	print(Settings.equipementConfig.data)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass