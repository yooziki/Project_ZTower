extends Area2D

@export var speed = 2
var moving = false
var tile_size = 64
var movement_direction = 0 # 0-不动 1-上 2-下 3-左 4-右
var player
var UIManager
var turnFirstFrame
var pressed = []
var attack_in_cd = false
@onready var LabelATT = $"../Control/PlayerValueBox/LabelATT"
@onready var ray_up = $PointingRayUp
@onready var ray_down = $PointingRayDown
@onready var ray_left = $PointingRayLeft
@onready var ray_right = $PointingRayRight
@onready var attack_cd = $AttackCD
@onready var ray_array = [ray_up,ray_down,ray_left,ray_right]
@onready var target_area = $Area2D


var inputs = {
	4: Vector2.RIGHT,
	3: Vector2.LEFT,
	1: Vector2.UP,
	2: Vector2.DOWN,
	0: Vector2.ZERO
}

var player_anims = {
	4: "moveright",
	3: "moveleft",
	1: "moveup",
	2: "movedown",
	0: "still"
}

const Class := preload("res://scripts/Class.gd")
const UIManagerGD := preload("res://scripts/UIManager.gd")

func _ready():
	#position = position.snapped(Vector2.ONE * tile_size)
	$CharacterSprite/AnimationPlayer.speed_scale = speed
	player = Class.Player.new(10,3,0,3)
	UIManager = UIManagerGD.new()

func _input(event):
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
	if moving:
		return
	var collider = ray_array[movement_direction-1].get_collider()
	if movement_direction != 0:
		if !collider:
			move(movement_direction)
		elif collider.is_in_group("Monster") && !attack_in_cd:
			print("向怪物攻击")
			attack_monster(collider)

func attack_monster(monster):
	attack_in_cd = true
	attack_cd.start()
	monster.HP -= player.ATT
	print("怪物被攻击，剩余血量："+str(monster.HP))
	print("玩家当前攻击力："+str(player.ATT))
	monster.refresh_ui()
	monster.attack_player(player)

func move(dir):
			print("尝试移动")
			$"../Highlight".position = position + inputs[dir] * tile_size	
			var movementTween = get_tree().create_tween()
			movementTween.tween_property(self, "position", position + inputs[dir] * tile_size, 0.8 / speed).set_trans(Tween.TRANS_LINEAR)
			moving = true
			print(player_anims[dir])
			$CharacterSprite/AnimationPlayer.play(player_anims[dir])
			await movementTween.finished
			moving = false
			$CharacterSprite/AnimationPlayer.stop()
			UIManager.call("refreshValueUI",LabelATT)

func _on_attack_cd_timeout():
	#长按方向键时的攻击CD计时
	attack_in_cd = false
	pass
