extends Panel

func change_eq_choose(dir,chara,delete_eq):
	if dir == "right":
		$Character/character_sprite/AnimationPlayer.play("attack_right")
		await get_tree().create_timer(0.5).timeout
		$AnimationPlayer.play("FadeOut")
		Main_gd.player_control = true
	if dir == "left":
		$Character/character_sprite/AnimationPlayer.play("attack_left")
		Equipment_gd.get_equipment(chara,Main_gd.changing_eq,delete_eq,false)
		await get_tree().create_timer(0.5).timeout
		$AnimationPlayer.play("FadeOut")
		Main_gd.player_control = true
	if dir == "down":
		$Character/character_sprite/AnimationPlayer.play("attack_down")
		await get_tree().create_timer(0.35).timeout
		$AnimationPlayer.play("FadeOut")
		var child = $Character.get_child(0)
		$Character.remove_child(child)
		Main_gd.player_control = true
	Main_gd.is_equipment_change = false
	await  $AnimationPlayer.animation_finished
	queue_free()	
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
