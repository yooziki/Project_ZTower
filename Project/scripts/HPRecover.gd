extends Area2D

var hp_change = 5
var dying = false
@onready var animator = $HPRecoverSprite/AnimationPlayer

func try_get(chara):
	chara.hp_change(hp_change)
	animator.play("get")
	await animator.animation_finished
	queue_free()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
