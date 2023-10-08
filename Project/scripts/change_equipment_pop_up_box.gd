extends Panel
func change_eq_choose(dir,chara,delete_eq):
	var player_animator = $Character/character_sprite/AnimationPlayer
	if dir == "right":
		player_animator.play("attack_right")
		delete_eq.queue_free()
		$AnimationPlayer.play("ChooseRight")
		await get_tree().create_timer(0.5).timeout
		$AnimationPlayer.play("FadeOut")
		Main_gd.player_control = true
	if dir == "left":
		player_animator.play("attack_left")
		delete_eq.get_equipment(chara,Main_gd.changing_eq,delete_eq,false)
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
	Main_gd.is_equipment_change = false
	await  $AnimationPlayer.animation_finished
	free()
	Main_gd.player_control = true
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
