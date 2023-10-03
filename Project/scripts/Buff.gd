extends Node

var buff_data

func add_buff(chara,buff_id):
	chara.ATT += buff_data[buff_id].ATT
	chara.DEF += buff_data[buff_id].DEF
	chara.HP += buff_data[buff_id].HP
	chara.LUCK += buff_data[buff_id].LUCK
	chara.DOG += buff_data[buff_id].DOG
	chara.CRI += buff_data[buff_id].CRI
	chara.SPD += buff_data[buff_id].SPD
	pass

func remove_buff(chara,buff_id):
	chara.ATT -= buff_data[buff_id].ATT
	chara.DEF -= buff_data[buff_id].DEF
	chara.HP -= buff_data[buff_id].HP
	chara.LUCK -= buff_data[buff_id].LUCK
	chara.DOG -= buff_data[buff_id].DOG
	chara.CRI -= buff_data[buff_id].CRI
	chara.SPD -= buff_data[buff_id].SPD

# Called when the node enters the scene tree for the first time.
func _ready():
	buff_data = Settings.buffConfig.data
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
