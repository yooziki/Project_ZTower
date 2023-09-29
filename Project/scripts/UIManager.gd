extends Node

@onready var LabelATT = $PlayerValueBox/LabelATT

func refreshValueUI(LabelATT):
	print("刷新数值")
	LabelATT.text = str(int(RandomNumberGenerator.new().randf_range(1,10)))


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
