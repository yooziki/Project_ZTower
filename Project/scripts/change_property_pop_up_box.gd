extends Control
var property_data 
var buff_data 
var pp_left = randi_range(1,4)
var pp_right = randi_range(1,4)
@onready var control = $"/root/Main/Control"

func change_pp_choose(dir,chara):
	if dir == "right":
		$Character/character_sprite/AnimationPlayer.play("attack_right")
		Buff_gd.add_buff(chara,pp_right+100001)
		await get_tree().create_timer(0.5).timeout
		$AnimationPlayer.play("FadeOut")
		Main_gd.player_control = true
	if dir == "left":
		$Character/character_sprite/AnimationPlayer.play("attack_left")
		Buff_gd.add_buff(chara,pp_left+100001)
		await get_tree().create_timer(0.5).timeout
		$AnimationPlayer.play("FadeOut")
		Main_gd.player_control = true
	if dir == "down":
		$Character/character_sprite/AnimationPlayer.play("attack_down")
		Buff_gd.add_buff(chara,100001)
		await get_tree().create_timer(0.5).timeout
		$AnimationPlayer.play("FadeOut")
		Main_gd.player_control = true
	var child = $Character.get_child(0)
	$Character.remove_child(child)
	Main_gd.is_property_change = false
	await  $AnimationPlayer.animation_finished
	queue_free()
	pass

func _ready():
	property_data = Settings.propertyConfig.data
	buff_data = Settings.buffConfig.data
	if pp_right == pp_left && pp_left != 4:
		pp_right += 1
	elif pp_right == pp_left && pp_left != 1:
		pp_right -= 1	
	
	var left_icon = control.icon_array[pp_left].duplicate()
	var right_icon = control.icon_array[pp_right].duplicate()
	var down_icon = control.icon_array[0].duplicate()
	
	left_icon.position = Vector2(0,0)
	right_icon.position = Vector2(0,0)
	down_icon.position = Vector2(0,0)
	
	left_icon.scale = Vector2(3,3)
	right_icon.scale = Vector2(3,3)
	down_icon.scale = Vector2(3,3)
	
	$ChangePropertyBox/PropertyTextureLeft.add_child(left_icon)
	$ChangePropertyBox/PropertyTextureRight.add_child(right_icon)
	$ChangePropertyBox/PropertyTextureDown.add_child(down_icon)

	$ChangePropertyBox/LeftLabel.text = buff_data[pp_left+100001].name
	$ChangePropertyBox/RightLabel.text = buff_data[pp_right+100001].name
	$ChangePropertyBox/DownLabel.text = buff_data[100001].name

	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
