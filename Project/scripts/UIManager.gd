extends Node

@onready var LabelATT = $PlayerValueBox/LabelATT
@onready var LabelDEF = $PlayerValueBox/LabelDEF
@onready var LabelSPD = $PlayerValueBox/LabelSPD
@onready var LabelCRI = $PlayerValueBox/LabelCRI
@onready var LabelDOG = $PlayerValueBox/LabelDOG
@onready var LabelLUCK = $PlayerValueBox/LabelLUCK
@onready var LabelHP = $PlayerInfoBox/LabelHP

@onready var IconATT = $PlayerValueBox/IconATT
@onready var IconDEF = $PlayerValueBox/IconDEF
@onready var IconSPD = $PlayerValueBox/IconSPD
@onready var IconCRI = $PlayerValueBox/IconCRI
@onready var IconDOG = $PlayerValueBox/IconDOG
@onready var IconLUCK = $PlayerValueBox/IconLUCK
@onready var IconHP = $PlayerInfoBox/IconHP

@onready var icon_array = [IconHP,IconATT,IconDEF,IconSPD,IconLUCK,IconDOG,IconCRI]

func refresh_ui(player):
	# print("刷新数值")
	LabelATT.text = str(player.ATT)
	LabelDEF.text = str(player.DEF)
	LabelSPD.text = str(player.SPD)
	LabelCRI.text = str(player.CRI)+"%"
	LabelDOG.text = str(player.DOG)+"%"
	LabelLUCK.text = str(player.LUCK)
	LabelHP.text = str(player.HP) + "/" + str(player.MAXHP)
	pass


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
