extends Node2D

var eq_slot = [0,0,0,0,0]
var player_control = true
var changing_eq:int
var delete_eq
var is_equipment_change = false
var is_property_change = false
var equipment_rare_list:Array[Array] = [[],[],[],[]]
var equipment_rare_weight = [40,70,85,90]
var tile_size = 64


# Called when the node enters the scene tree for the first time.
func _ready():
	#武器稀有度分组
	print(Settings.equipementConfig.data)
	var eq_data = Settings.equipementConfig.data
	var eq_data_key = eq_data.keys()
	print(eq_data_key)
	for i in eq_data_key:
		#if eq_data[i].rare == 1:
		equipment_rare_list[eq_data[i].rare-1].append(eq_data[i])
	pass
	print(equipment_rare_list)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
