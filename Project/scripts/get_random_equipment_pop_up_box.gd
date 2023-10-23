extends Panel
@onready var OldEq1 = get_node("ChangeEquipmentBox/OldEq1")
@onready var OldEq2 = get_node("ChangeEquipmentBox/OldEq2")
@onready var NewEq1 = get_node("ChangeEquipmentBox/NewEq1")
@onready var NewEq2 = get_node("ChangeEquipmentBox/NewEq2")
@onready var control = $"/root/Main/Control"
var eq1
var eq2

func get_eq_choose(dir,chara,delete_eq):
	var player_animator = $Character/character_sprite/AnimationPlayer
	if dir == "right":
		player_animator.play("attack_right")
		Equipment_gd.get_equipment(chara,eq2.id,delete_eq,false)
		delete_eq.queue_free()
		$AnimationPlayer.play("ChooseRight")
		await get_tree().create_timer(0.5).timeout
		$AnimationPlayer.play("FadeOut")
		Main_gd.player_control = true
	if dir == "left":
		player_animator.play("attack_left")
		Equipment_gd.get_equipment(chara,eq1.id,delete_eq,false)
		$AnimationPlayer.play("ChooseLeft")
		await get_tree().create_timer(0.5).timeout
		$AnimationPlayer.play("FadeOut")
		Main_gd.player_control = true
	if dir == "down":
		player_animator.play("attack_down")
		await get_tree().create_timer(0.35).timeout
		$AnimationPlayer.play("FadeOut")
		var child = $Character.get_child(0)
		$Character.remove_child(child)
		#Main_gd.player_control = true
	Main_gd.is_equipment_get = false
	await  $AnimationPlayer.animation_finished
	free()
	Main_gd.player_control = true
	
func eq_panel_des(panel, data):
	panel.get_node()
	
	
	
func _ready():
	eq1 = Main_gd.random_equipment()
	eq2 = Main_gd.random_equipment()
	print(eq1)
	print(Main_gd.eq_slot[eq1.slotID])

	control.eq_panel_des(NewEq1, eq1)
	control.eq_panel_des(NewEq2, eq2)
	var icon1 = load("res://assets/临时资源/像素RPG游戏图标 装备物品道具武器素材 手游2D资源防具技能食物/"+eq1.icon)
	var icon2 = load("res://assets/临时资源/像素RPG游戏图标 装备物品道具武器素材 手游2D资源防具技能食物/"+eq2.icon)
	get_node("ChangeEquipmentBox/Icon1").texture = icon1
	get_node("ChangeEquipmentBox/Icon2").texture = icon2
	print(Main_gd.eq_slot)
	
	if Main_gd.eq_slot[eq1.slotID]:
		OldEq1.scale = Vector2(1,1)
		print("slot1："+str(eq1.slotID))
		print("slot1："+str(Main_gd.eq_slot[eq1.slotID]))
		control.eq_panel_des(OldEq1, Main_gd.eq_slot[eq1.slotID])
	if Main_gd.eq_slot[eq2.slotID]:
		OldEq2.scale = Vector2(1,1)
		print("slot2："+str(Main_gd.eq_slot[eq2.slotID]))
		control.eq_panel_des(OldEq2, Main_gd.eq_slot[eq2.slotID])
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
