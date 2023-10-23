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
var random_eq_cell = Vector2(5,16)

var  tile_dict = {
	Vector2i(10,31): "equipment",
	Vector2i(11,31): "hp_recover",
	Vector2i(12,31): "property",
	Vector2i(13,31): "monster",
	Vector2i(23,6): "character",
	Vector2i(24,6): "next_floor",
	Vector2i(21,12): "stone",
	Vector2i(5,16): "random_eq"
}

func create_cell(cell_position):
	var vector = tilemap.get_cell_atlas_coords(1, cell_position,false)
	var position = cell_position * Main_gd.tile_size + Vector2i(Main_gd.tile_size/2, Main_gd.tile_size/2)
	var new_node = load("res://scenes/level_content_prefab/"+tile_dict[vector]+".tscn").instantiate()
	add_child(new_node)
	new_node.position = position

func create_room():
	tilemap = $TileMap
	print("tilemap的ID****"+str(tilemap.get_used_cells(1)))
	var cell_array = tilemap.get_used_cells(1)
	for i in cell_array:
		create_cell(i)
	tilemap.clear_layer(1)

func _ready():
	var next_level = Main_gd.level_array[Main_gd.current_level]
	var next_level_node = load("res://scenes/level_data/"+str(next_level)+".tscn").instantiate()
	add_child(next_level_node)
	create_room()



