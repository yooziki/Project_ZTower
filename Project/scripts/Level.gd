extends Node2D
var tilemap
var room_id:int

var eq_cell = Vector2(10,31)
var hp_recover_cell = Vector2(11,31)
var pp_cell = Vector2(12,31)
var monster_cell = Vector2(13,31)
var boss_cell = Vector2(13,31)
var character_cell = Vector2(23,6)
var next_floor_cell = Vector2(24,6)
var stone_cell = Vector2(21,12)



func create_monster(cell_position):
	var position = cell_position * Main_gd.tile_size + Vector2i(Main_gd.tile_size/2, Main_gd.tile_size/2)
	var new_node = load("res://scenes/level_content_prefab/monster.tscn").instantiate()
	add_child(new_node)
	new_node.position = position

func create_character(cell_position):
	var position = cell_position * Main_gd.tile_size
	var new_node = load("res://scenes/level_content_prefab/character.tscn").instantiate()
	add_child(new_node)
	new_node.position = position
	
func create_next_floor(cell_position):
	var position = cell_position * Main_gd.tile_size + Vector2i(Main_gd.tile_size/2, Main_gd.tile_size/2)
	var new_node = load("res://scenes/level_content_prefab/next_floor.tscn").instantiate()
	add_child(new_node)
	new_node.position = position
	
func create_stone(cell_position):
	var position = cell_position * Main_gd.tile_size + Vector2i(Main_gd.tile_size/2, Main_gd.tile_size/2)
	var new_node = load("res://scenes/level_content_prefab/stone.tscn").instantiate()
	add_child(new_node)
	new_node.position = position

func create_hp_recover(cell_position):
	var position = cell_position * Main_gd.tile_size + Vector2i(Main_gd.tile_size/2, Main_gd.tile_size/2)
	var new_node = load("res://scenes/level_content_prefab/hp_recover.tscn").instantiate()
	add_child(new_node)
	new_node.position = position

func create_property(cell_position):
	var position = cell_position * Main_gd.tile_size + Vector2i(Main_gd.tile_size/2, Main_gd.tile_size/2)
	var new_node = load("res://scenes/level_content_prefab/property.tscn").instantiate()
	add_child(new_node)
	new_node.position = position

func random_equipment():
	var rare = random_equipment_rare()
	print(rare)
	# var eq_id = RandomNumberGenerator.new().randi_range(0,Main_gd.equipment_rare_list[rare-1].size()-1)
	var eq = Main_gd.equipment_rare_list[rare-1].pick_random()
	return eq

func create_eq(cell_position):
	var position = cell_position * Main_gd.tile_size + Vector2i(Main_gd.tile_size/2, Main_gd.tile_size/2)
	var new_node = load("res://scenes/level_content_prefab/equipment.tscn").instantiate()
	add_child(new_node)
	new_node.self_data = random_equipment()
	print("初始化装备"+str(new_node.self_data))
	new_node.get_node("EquipmentSprite").texture = load("res://assets/临时资源/像素RPG游戏图标 装备物品道具武器素材 手游2D资源防具技能食物/"+new_node.self_data.icon)
	new_node.position = position

func create_room():
	tilemap = $TileMap
	print("tilemap的ID****"+str(tilemap.get_used_cells_by_id(1,-1,monster_cell,-1)))
	var monster_array = tilemap.get_used_cells_by_id(1,-1,monster_cell,-1)
	for i in monster_array:
		create_monster(i)
	var eq_array = tilemap.get_used_cells_by_id(1,-1,eq_cell,-1)
	for i in eq_array:
		create_eq(i)
	var hp_recover_array = tilemap.get_used_cells_by_id(1,-1,hp_recover_cell,-1)
	for i in hp_recover_array:
		create_hp_recover(i)
	var pp_array = tilemap.get_used_cells_by_id(1,-1,pp_cell,-1)
	for i in pp_array:
		create_property(i)
	var stone_array = tilemap.get_used_cells_by_id(1,-1,stone_cell,-1)
	for i in stone_array:
		create_stone(i)
	var cell_array = tilemap.get_used_cells_by_id(1,-1,next_floor_cell,-1)
	for i in cell_array:
		create_next_floor(i)		
	var chara_array = tilemap.get_used_cells_by_id(1,-1,character_cell,-1)
	for i in chara_array:
		create_character(i)
	tilemap.clear_layer(1)

func _ready():
	var next_level = Main_gd.level_array[Main_gd.current_level]
	var next_level_node = load("res://scenes/level_data/"+str(next_level)+".tscn").instantiate()
	add_child(next_level_node)
	create_room()

func random_equipment_rare():
	var all_weight = Main_gd.equipment_rare_weight[-1]
	var rare = 0
	var random_number = RandomNumberGenerator.new().randi_range(1,all_weight)
	if random_number <= Main_gd.equipment_rare_weight[0]:
		rare = 1
	elif random_number <= Main_gd.equipment_rare_weight[1]:
		rare = 2 
	elif random_number <= Main_gd.equipment_rare_weight[2]:
		rare = 3 
	else:
		rare = 4 
	return rare
