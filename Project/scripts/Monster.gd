extends CharacterBody2D

var HP: int
var ATT: int
var SPD: int
var DEF: int
var NAME: String

func put_on_map():
	var sprite = Sprite2D.new()
	var icon = preload("res://assets/character/rpg-character.png")
	sprite.set_texture(icon)
	sprite.position.x = 200
	sprite.position.y = 200
	return sprite

func refresh_ui():
	$Control/BarHP.value = HP
	$Control/LabelHP.text = str(HP)
	pass

func attack_player(player):
	player.HP -= ATT
	pass
	
# Called when the node enters the scene tree for the first time.
func _ready():
	print("创建 Monster："+name)
	HP = 5
	ATT = 2
	$Control/BarHP.min_value = 0
	$Control/BarHP.max_value = HP	
	refresh_ui()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
