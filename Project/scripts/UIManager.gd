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
@onready var HPChangeBox = $HPChangeBox
@onready var EqBox = $PlayerEqBox.get_children()
@onready var buff_data = Settings.buffConfig.data



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

func HP_change_animation(be_attacker, is_DOG, is_CRI, damage):
	var HP_change_box = load("res://scenes/ui_prefab/hp_change.tscn").instantiate()
	var HP_change_label = HP_change_box.get_node("Label")
	HPChangeBox.add_child(HP_change_box)
	HP_change_box.position = be_attacker.position
	if is_DOG:
		HP_change_label.text = "闪避"
		HP_change_box.get_node("AnimationPlayer").play("HPChangeNormal")
	elif is_CRI:
		HP_change_label.text = str(damage)
		HP_change_box.get_node("AnimationPlayer").play("HPChangeCRI")
	else:
		HP_change_label.text = str(damage)
		HP_change_box.get_node("AnimationPlayer").play("HPChangeNormal")
	#HPChangeBox.position = be_attacker.position
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func show_eq_des_box(index):
	if Main_gd.eq_slot[index]:
		EqBox[5].get_node("LabelEqDes").text = Main_gd.eq_slot[index].self_data.des
		EqBox[5].get_node("LabelEqName").text = Main_gd.eq_slot[index].self_data.name
		EqBox[5].get_node("IconEq").texture = load("res://assets/临时资源/像素RPG游戏图标 装备物品道具武器素材 手游2D资源防具技能食物/"+Main_gd.eq_slot[index].self_data.icon)
		EqBox[5].position = EqBox[index].position + Vector2(45,0)
		var buff_id = Main_gd.eq_slot[index].self_data.buffID
		var pp_index = 1
		if buff_data[buff_id]["ATT"] != 0:
			EqBox[5].get_node("LabelPP"+str(pp_index)).text = str(buff_data[buff_id]["ATT"])
			EqBox[5].get_node("IconPP"+str(pp_index)).texture = icon_array[1].texture
			pp_index += 1
		if buff_data[buff_id]["DEF"] != 0:
			EqBox[5].get_node("LabelPP"+str(pp_index)).text = str(buff_data[buff_id]["DEF"])
			EqBox[5].get_node("IconPP"+str(pp_index)).texture = icon_array[2].texture
			pp_index += 1
		if buff_data[buff_id]["SPD"] != 0:
			EqBox[5].get_node("LabelPP"+str(pp_index)).text = str(buff_data[buff_id]["SPD"])
			EqBox[5].get_node("IconPP"+str(pp_index)).texture = icon_array[3].texture
			pp_index += 1
		if buff_data[buff_id]["LUCK"] != 0:
			EqBox[5].get_node("LabelPP"+str(pp_index)).text = str(buff_data[buff_id]["LUCK"])
			EqBox[5].get_node("IconPP"+str(pp_index)).texture = icon_array[4].texture
			pp_index += 1
		#需要把buff结构改为枚举类后再做
		
		
func _on_eq_1_mouse_entered():
	show_eq_des_box(0)

func _on_eq_1_mouse_exited():
	EqBox[5].position = Vector2(3000,3000)


func _on_eq_2_mouse_entered():
	show_eq_des_box(1)


func _on_eq_2_mouse_exited():
	_on_eq_1_mouse_exited()

func _on_eq_3_mouse_entered():
	show_eq_des_box(2)

func _on_eq_3_mouse_exited():
	_on_eq_1_mouse_exited()


func _on_eq_4_mouse_entered():
	show_eq_des_box(3)

func _on_eq_4_mouse_exited():
	_on_eq_1_mouse_exited()


func _on_eq_5_mouse_entered():
	show_eq_des_box(4)


func _on_eq_5_mouse_exited():
	_on_eq_1_mouse_exited()
