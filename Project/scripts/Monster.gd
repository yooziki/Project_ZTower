extends CharacterBody2D

var HP: int
var ATT: int
var SPD: int
var DEF: int
var NAME: String
@onready var animator = $MonsterSprite/AnimationPlayer
@onready var ui_manager = $"/root/Main/Control"
var monster_anims_attack = {
	4: "attack_left",
	3: "attack_right",
	1: "attack_down",
	2: "attack_up"
}

func put_on_map():
	var sprite = Sprite2D.new()
	var icon = preload("res://assets/character/rpg-character.png")
	sprite.set_texture(icon)
	sprite.position.x = 200
	sprite.position.y = 200
	return sprite

func attacked(player,movement_direction):
	HP -= player.ATT
	refresh_ui()
	if HP > 0:
		animator.play("Attacked")
		attack_player(player,movement_direction)
		pass
	else:
		animator.play("dead")
		await animator.animation_finished
		queue_free()
		#self.remove_child(self)

func refresh_ui():
	$Control/BarHP.value = HP
	$Control/LabelHP.text = str(HP)
	pass

func attack_player(player,dir):
	await animator.animation_finished
	animator.play(monster_anims_attack[dir])	
	player.animator.play("attacked")
	await animator.animation_finished	
	player.HP -= ATT
	ui_manager.refresh_ui(player)
	animator.play("idle_down")
	pass
	
# Called when the node enters the scene tree for the first time.
func _ready():
	print("创建 Monster："+name)
	HP = 15
	ATT = 2
	$Control/BarHP.min_value = 0
	$Control/BarHP.max_value = HP	
	$MonsterSprite.position = Vector2(-0,0)
	$MonsterSprite.rotation = 0
	$MonsterSprite.scale = Vector2(0.5,0.5)
	$MonsterSprite.skew = 0
	$MonsterSprite.modulate = Color(1, 1, 1, 1)
	animator.play("idle_down")
	refresh_ui()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
