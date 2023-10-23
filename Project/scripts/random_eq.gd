extends Area2D
var dying = false

@onready var control = $"/root/Main/Control"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func try_get(chara):
	var change_eq_scene = load("res://scenes/ui_prefab/get_random_equipment_pop_up_box.tscn")
	var change_eq_node = change_eq_scene.instantiate()
	Main_gd.delete_eq = self
	Main_gd.player_control = false
	Main_gd.is_equipment_get = true
	control.add_child(change_eq_node)
	change_eq_node.get_node("AnimationPlayer").play("FadeIn")
	var character_sprite = $/root/Main/Level/Character/CharacterSprite.duplicate()
	character_sprite.name = "character_sprite"
	change_eq_node.get_node("Character").add_child(character_sprite)
	#var source_icon = load("res://assets/临时资源/像素RPG游戏图标 装备物品道具武器素材 手游2D资源防具技能食物/"+Main_gd.eq_slot[eq_data[eq_id].slotID].self_data.icon)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
