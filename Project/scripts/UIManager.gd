extends Node

@onready var LabelATT = $PlayerValueBox/LabelATT
@onready var LabelDEF = $PlayerValueBox/LabelDEF
@onready var LabelSPD = $PlayerValueBox/LabelSPD
@onready var LabelCRI = $PlayerValueBox/LabelCRI
@onready var LabelDOG = $PlayerValueBox/LabelDOG
@onready var LabelLUCK = $PlayerValueBox/LabelLUCK
@onready var LabelHP = $PlayerInfoBox/LabelHP

func refresh_ui(player):
	# print("刷新数值")
	LabelATT.text = str(player.ATT)
	LabelDEF.text = str(player.DEF)
	LabelSPD.text = str(player.SPD)
	LabelCRI.text = str(player.CRI)+"%"
	LabelDOG.text = str(player.DOG)+"%"
	LabelLUCK.text = str(player.LUCK)
	LabelHP.text = str(player.HP)
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
