extends Area2D

var hp_change = 5
var dying = false
@onready var level_node = $/root/Main/Level

func try_get(chara):
	Main_gd.current_level += 1
	print("当前关卡："+str(Main_gd.current_level))
	print("总关卡："+str(Main_gd.level_array.size()))
	if Main_gd.current_level == Main_gd.level_array.size():
		dying = true
		$/root/Main/Control/AnimationPlayer.play("YouWin")
	else:
		var next_level = Main_gd.level_array[Main_gd.current_level]
		var next_level_node = load("res://scenes/level_data/"+str(next_level)+".tscn").instantiate()
		for i in level_node.get_children():
			level_node.remove_child(i)
		level_node.add_child(next_level_node)
		level_node.create_room()
		queue_free()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
