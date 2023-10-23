extends CharacterBody2D

var HP: int
var ATT: int
var SPD: int
var CRI: int
var DEF: int
var DOG: int
var NAME: String
var rng = RandomNumberGenerator.new()
var monster_data

var CRI_times = 2
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

func battle_turn(attacker, be_attacker):
	var is_DOG = false
	var is_CRI = false
	var damage = 0
	if be_attacker.DOG >= rng.randi_range(0, 100):
		is_DOG = true
		be_attacker.animator.play("dodged")
		await be_attacker.animator.animation_finished
	else:
		is_DOG = false
		if attacker.CRI >= rng.randi_range(0, 100):
			is_CRI = true
			damage = maxi(attacker.ATT*attacker.CRI_times  - be_attacker.DEF,0)
			be_attacker.HP -= damage
		else:
			is_CRI = false
			damage = maxi(attacker.ATT - be_attacker.DEF,0)
			be_attacker.HP -= damage
		be_attacker.animator.play("attacked")
	print("跳字一次："+str(is_DOG))
	ui_manager.HP_change_animation(be_attacker, is_DOG, is_CRI, damage)	

func attacked(player,movement_direction):
	battle_turn(player,self)
	refresh_ui()
	if HP > 0:
		animator.play("Attacked")
		# attack_player(player,movement_direction)
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
	#await animator.animation_finished
	animator.play(monster_anims_attack[dir])	

	await animator.animation_finished
	battle_turn(self,player)
		
	ui_manager.refresh_ui(player)
	animator.play("idle_down")
	pass
	
# Called when the node enters the scene tree for the first time.
func _ready():
	$Control/BarHP.min_value = 0
	$Control/BarHP.max_value = HP	

	animator.play("idle_down")
	refresh_ui()
	pass

	eq_data = Settings.equipementConfig.data
	self_data = Main_gd.random_equipment()
	var sprite_node = get_node("EquipmentSprite")
	if sprite_node:
		sprite_node.texture = load("res://assets/临时资源/像素RPG游戏图标 装备物品道具武器素材 手游2D资源防具技能食物/"+self_data.icon)




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
