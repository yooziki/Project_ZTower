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
var level_array = []
var current_level = 0

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
	level_id_random()

func level_id_random():
	var level_data = Settings.levelConfig.data
	for i in Settings.levelConfig.data:
		print(i)
		level_array.append(level_data[i].levelPool.pick_random())
	print("随机关卡完成："+str(level_array))	

func _process(delta):
	pass
