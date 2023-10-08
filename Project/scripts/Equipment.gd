extends Area2D

var eq_icon
var eq_rare:int
var eq_data
var des:String
var dying = false #是否正在销毁中
var change_eq_scene
var change_eq_node
var self_data = {
	"id":1,
	"buffID":1,
	"slotID":0,
	"icon":"",
	"des":"如果看到这行字，说明他妈的有bug了，没读取到装备信息",
	"name":"默认名称"
}

@onready var animator = $EquipmentSprite/AnimationPlayer
@onready var control = $"/root/Main/Control"
@onready var player_eq_box = control.get_node("PlayerEqBox")

func get_equipment(chara,eq_id,delete_eq,is_play_delete_anim):
	dying = true
	var buff_id = eq_data[eq_id].buffID
	Buff_gd.add_buff(chara,buff_id)
	print(eq_data[eq_id].icon)
	var eq_icon = load("res://assets/临时资源/像素RPG游戏图标 装备物品道具武器素材 手游2D资源防具技能食物/"+eq_data[eq_id].icon)
	if Main_gd.eq_slot[eq_data[eq_id].slotID]:
		Buff_gd.remove_buff(chara,Main_gd.eq_slot[eq_data[eq_id].slotID].self_data.buffID)
	
	Main_gd.eq_slot[eq_data[eq_id].slotID] = self.duplicate()
	print("复制到了全局slot的self_data:"+str(Main_gd.eq_slot[eq_data[eq_id].slotID].self_data))
	print("当前自己的self_data:"+str(self_data))
	Main_gd.eq_slot[eq_data[eq_id].slotID].self_data = self_data
	print("第二次复制到了全局slot的self_data:"+str(Main_gd.eq_slot[eq_data[eq_id].slotID].self_data))
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
	if Main_gd.eq_slot[self_data.slotID]:
		Main_gd.changing_eq = self_data.id
		Main_gd.is_equipment_change = true
		change_equipment(self_data.id)
	else:	
		animator.play("get")
		get_equipment(chara,self_data.id,self,true)

	pass

func change_equipment(eq_id):
	change_eq_scene = load("res://scenes/change_equipment_pop_up_box.tscn")
	change_eq_node = change_eq_scene.instantiate()
	Main_gd.delete_eq = self
	Main_gd.player_control = false
	control.add_child(change_eq_node)
	change_eq_node.get_node("AnimationPlayer").play("FadeIn")
	var character_sprite = $/root/Main/Character/CharacterSprite.duplicate()
	character_sprite.name = "character_sprite"
	change_eq_node.get_node("Character").add_child(character_sprite)
	change_eq_node.get_node("ChangeEquipmentBox/SourceDes").text = Main_gd.eq_slot[eq_data[eq_id].slotID].self_data.des
	change_eq_node.get_node("ChangeEquipmentBox/TargetDes").text = eq_data[eq_id].des
	#var source_icon = load("res://assets/临时资源/像素RPG游戏图标 装备物品道具武器素材 手游2D资源防具技能食物/"+Main_gd.eq_slot[eq_data[eq_id].slotID].self_data.icon)
	var source_icon = get_node("/root/Main/Control/PlayerEqBox/Eq_"+str(eq_data[eq_id].slotID+1)+"/TextureRect").texture
	print(Main_gd.eq_slot[eq_data[eq_id].slotID].self_data)
	var target_icon = load("res://assets/临时资源/像素RPG游戏图标 装备物品道具武器素材 手游2D资源防具技能食物/"+eq_data[eq_id].icon)
	change_eq_node.get_node("ChangeEquipmentBox/TargetEquipment").texture = target_icon
	change_eq_node.get_node("ChangeEquipmentBox/SourceEquipment").texture = source_icon
	change_eq_node.get_node("ChangeEquipmentBox/TargetNameLabel").text = eq_data[eq_id].name
	print("****报错用调试："+str(Main_gd.eq_slot[eq_data[eq_id].slotID].self_data))
	change_eq_node.get_node("ChangeEquipmentBox/SourceNameLabel").text =  Main_gd.eq_slot[eq_data[eq_id].slotID].self_data.name
	pass

func _ready():
	eq_data = Settings.equipementConfig.data

	pass


func _process(delta):
	pass
