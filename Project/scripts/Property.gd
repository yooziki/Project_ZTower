extends Area2D

@onready var control = $"/root/Main/Control"
var change_pp_scene
var change_pp_node
var dying = false

func try_get(chara):
	Main_gd.is_property_change = true
	Main_gd.player_control = false
	control.add_child(change_pp_node)
	change_pp_node.get_node("AnimationPlayer").play("FadeIn")
	var character_sprite = $/root/Main/Character/CharacterSprite.duplicate()
	character_sprite.name = "character_sprite"
	change_pp_node.get_node("Character").add_child(character_sprite)
	queue_free()	
	pass


# Called when the node enters the scene tree for the first time.
func _ready():
	change_pp_scene = load("res://scenes/change_property_pop_up_box.tscn")
	change_pp_node = change_pp_scene.instantiate()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
