extends Area2D

var eq_icon
var eq_rare:int
var eq_data
var des:String
var eq_id = 1
var buff_id = 1
var dying = false #是否正在销毁中
var change_eq_scene
var change_eq_node

@onready var animator = $EquipmentSprite/AnimationPlayer
@onready var control = $"/root/Main/Control"
@onready var player_eq_box = control.get_node("PlayerEqBox")

func get_equipment(chara,eq_id,delete_eq,is_play_delete_anim):
	dying = true
	var buff_id = eq_data[eq_id].buffID
	Buff_gd.add_buff(chara,buff_id)
	var eq_icon = load("res://assets/临时资源/像素RPG游戏图标 装备物品道具武器素材 手游2D资源防具技能食物/武器/"+eq_data[eq_id].icon)		
	if Main_gd.eq_slot[eq_data[eq_id].slotID]:
		Buff_gd.remove_buff(chara,Main_gd.eq_slot[eq_data[eq_id].slotID].buff_id)
	Main_gd.eq_slot[eq_data[eq_id].slotID] = self.duplicate()	
	Equipment_gd.player_eq_box.get_child(eq_data[eq_id].slotID).get_node("TextureRect").texture = eq_icon
	Equipment_gd.player_eq_box.get_child(eq_data[eq_id].slotID).get_node("Label").text = ""
	control.refresh_ui(chara)
	if is_play_delete_anim:
		animator.play("get")
		await animator.animation_finished 
		delete_eq.queue_free()
	else:
		delete_eq.queue_free()			 
		
		
func try_get(chara):
	print("拾取装备："+str(eq_id))
	if Main_gd.eq_slot[eq_data[eq_id].slotID]:
		Main_gd.changing_eq = eq_id
		Main_gd.is_equipment_change = true
		change_equipment(eq_id)

	else:	
		animator.play("get")
		get_equipment(chara,eq_id,self,true)

	pass

func change_equipment(eq_id):
	Main_gd.delete_eq = self
	Main_gd.player_control = false
	control.add_child(change_eq_node)
	change_eq_node.get_node("AnimationPlayer").play("FadeIn")
	var character_sprite = $/root/Main/Character/CharacterSprite.duplicate()
	character_sprite.name = "character_sprite"
	change_eq_node.get_node("Character").add_child(character_sprite)
	change_eq_node.get_node("ChangeEquipmentBox/SourceDes").text = Main_gd.eq_slot[eq_data[eq_id].slotID].des
	change_eq_node.get_node("ChangeEquipmentBox/TargetDes").text = eq_data[eq_id].des
	var source_icon = $EquipmentSprite.texture
	var target_icon = load("res://assets/临时资源/像素RPG游戏图标 装备物品道具武器素材 手游2D资源防具技能食物/武器/"+eq_data[eq_id].icon)
	change_eq_node.get_node("ChangeEquipmentBox/TargetEquipment").texture = target_icon
	change_eq_node.get_node("ChangeEquipmentBox/SourceEquipment").texture = source_icon
	pass

func _ready():
	eq_data = Settings.equipementConfig.data
	change_eq_scene = load("res://scenes/change_equipment_pop_up_box.tscn")
	change_eq_node = change_eq_scene.instantiate()
	pass


func _process(delta):
	pass
