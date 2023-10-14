extends Area2D

@export var move_speed = 2
@export var HP = 2
@export var MAXHP = 2
@export var ATT = 2
@export var DEF = 2
@export var SPD = 2
@export var LUCK = 2
@export var DOG = 2
@export var CRI = 2
@onready var high_light = $/root/Main/Highlight

signal  choose_eq(eq)
var moving = false
var movement_direction = 0 # 0-不动 1-上 2-下 3-左 4-右
var UIManager
var turnFirstFrame
var pressed = []
var attack_in_cd = false

@onready var ui_manager = $"/root/Main/Control"
@onready var ray_up = $PointingRayUp
@onready var ray_down = $PointingRayDown
@onready var ray_left = $PointingRayLeft
@onready var ray_right = $PointingRayRight
@onready var attack_cd = $AttackCD
@onready var ray_array = [ray_up,ray_down,ray_left,ray_right]
@onready var animator = $CharacterSprite/AnimationPlayer

var inputs = {
	4: Vector2.RIGHT,
	3: Vector2.LEFT,
	1: Vector2.UP,
	2: Vector2.DOWN,
	0: Vector2.ZERO
}

var player_anims = {
	4: "move_right",
	3: "move_left",
	1: "move_up",
	2: "move_down"
}

var player_anims_idle = {
	4: "idle_right",
	3: "idle_left",
	1: "idle_up",
	2: "idle_down"
}

var player_anims_attack = {
	4: "attack_right",
	3: "attack_left",
	1: "attack_up",
	2: "attack_down"
}

const Class := preload("res://scripts/Class.gd")

func _ready():
	#position = position.snapped(Vector2.ONE * Main_gd.tile_size)
	#ui_manager.refresh_ui(self)
	$CharacterSprite/AnimationPlayer.speed_scale = move_speed
	animator.play(player_anims_idle[2])
	$CharacterSprite.position=Vector2(0,0)
	modulate = Color(1,1,1,1)
	ui_manager.refresh_ui(self)

func _input(event):
	if !Main_gd.player_control && Main_gd.is_equipment_change:
		var change_eq_box = $"/root/Main/Control/PopUpBox"
		if event.is_action_pressed("moveright"):
			change_eq_box.change_eq_choose("right",self,Main_gd.delete_eq)
		elif event.is_action_pressed("moveleft"):
			change_eq_box.change_eq_choose("left",self,Main_gd.delete_eq)
		elif event.is_action_pressed("movedown"):
			change_eq_box.change_eq_choose("down",self,Main_gd.delete_eq)
	if !Main_gd.player_control && Main_gd.is_property_change:
		var change_pp_box = $"/root/Main/Control/PopUpBox"
		if event.is_action_pressed("moveright"):
			change_pp_box.change_pp_choose("right",self)
		elif event.is_action_pressed("moveleft"):
			change_pp_box.change_pp_choose("left",self)
		elif event.is_action_pressed("movedown"):
			change_pp_box.change_pp_choose("down",self)
		ui_manager.refresh_ui(self)
			
	if event.as_text() in ["W", "A", "S", "D"]:
		if event.is_action_pressed("moveright"):
			pressed.append(4)
		elif event.is_action_pressed("moveleft"):
			pressed.append(3)
		elif event.is_action_pressed("moveup"):
			pressed.append(1)
		elif event.is_action_pressed("movedown"):
			pressed.append(2)

		if event.is_action_released("moveright"):
			pressed.erase(4)
		elif event.is_action_released("moveleft"):
			pressed.erase(3)
		elif event.is_action_released("moveup"):
			pressed.erase(1)
		elif event.is_action_released("movedown"):
			pressed.erase(2)

		if len(pressed) > 0:
			movement_direction = pressed[-1]
		else:
			movement_direction = 0

func _physics_process(delta):

	if moving || !Main_gd.player_control:
		return
	var collider = ray_array[movement_direction-1].get_collider()
	if movement_direction != 0:
		if !collider:
			move(movement_direction)
		elif collider.is_in_group("Monster") && !attack_in_cd:
			attack_monster(collider,movement_direction)
		elif collider.is_in_group("CanGet") && !collider.dying:
			animator.play(player_anims_attack[movement_direction])
			collider.try_get(self)
			ui_manager.refresh_ui(self)

func attack_monster(monster,dir):
	animator.play(player_anims_attack[movement_direction])
	attack_in_cd = true
	attack_cd.start()
	monster.attacked(self,movement_direction)
	#await animator.animation_finished
	await get_tree().create_timer(0.65).timeout
	animator.play(player_anims_idle[dir])

func move(dir):
	high_light.position = position + inputs[dir] * Main_gd.tile_size	
	var movementTween = get_tree().create_tween()
	movementTween.tween_property(self, "position", position + inputs[dir] * Main_gd.tile_size, 0.8 / move_speed).set_trans(Tween.TRANS_LINEAR)
	moving = true
	print(player_anims[dir])
	animator.play(player_anims[dir])
	await movementTween.finished
	moving = false
	animator.stop()
	ui_manager.refresh_ui(self)
	animator.play(player_anims_idle[dir])

func _on_attack_cd_timeout():
	#长按方向键时的攻击CD计时
	attack_in_cd = false
	pass
	
func hp_change(hp_change):
	HP += hp_change
	if HP > MAXHP:
		HP = MAXHP
	elif HP < 0:
		HP = 0
	
		


