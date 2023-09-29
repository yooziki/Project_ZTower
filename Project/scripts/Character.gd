extends Area2D

@export var speed = 2
var moving = false
var tile_size = 32
var movement_direction = "still"
var player
var UIManager
var pressed = []
@onready var LabelATT = $"../Control/PlayerValueBox/LabelATT"
@onready var ray = $PointingRay


var inputs = {
	"moveright": Vector2.RIGHT,
	"moveleft": Vector2.LEFT,
	"moveup": Vector2.UP,
	"movedown": Vector2.DOWN,
	"still": Vector2.ZERO
}

const Class := preload("res://scripts/Class.gd")
const UIManagerGD := preload("res://scripts/UIManager.gd")


func _ready():
	#position = position.snapped(Vector2.ONE * tile_size)
	$CharacterSprite/AnimationPlayer.speed_scale = speed
	player = Class.Player.new()
	UIManager = UIManagerGD.new()


func _input(event):
	if event.as_text() in ["W", "A", "S", "D"]:
		if event.is_action_pressed("moveright"):
			pressed.append("moveright")
		elif event.is_action_pressed("moveleft"):
			pressed.append("moveleft")
		elif event.is_action_pressed("moveup"):
			pressed.append("moveup")
		elif event.is_action_pressed("movedown"):
			pressed.append("movedown")

		if event.is_action_released("moveright"):
			pressed.erase("moveright")
		elif event.is_action_released("moveleft"):
			pressed.erase("moveleft")
		elif event.is_action_released("moveup"):
			pressed.erase("moveup")
		elif event.is_action_released("movedown"):
			pressed.erase("movedown")

		if len(pressed) > 0:
			movement_direction = pressed[-1]
		else:
			movement_direction = "still"

func _process(_delta):
	if moving:
		return
	move(movement_direction)

func move(dir):
	if movement_direction != "still":
		ray.target_position = inputs[dir] * tile_size
		ray.force_raycast_update()
		# LabelATT.text = "1"
		if !ray.is_colliding():
			
			$"../Highlight".position = position + inputs[dir] * tile_size
			
			var movementTween = get_tree().create_tween()
			movementTween.tween_property(self, "position", position + inputs[dir] * tile_size, 0.8 / speed).set_trans(Tween.TRANS_LINEAR)
			moving = true
			$CharacterSprite/AnimationPlayer.play(dir)
			await movementTween.finished
			moving = false
			$CharacterSprite/AnimationPlayer.stop()
		
			UIManager.call("refreshValueUI",LabelATT)
		
