extends Panel

func change_eq_choose(dir,chara):
	if dir == "right":
		$Character/character_sprite/AnimationPlayer.play("attack_right")
		await get_tree().create_timer(0.65).timeout
		$AnimationPlayer.play("FadeOut")
		Main_gd.player_control = true
	if dir == "left":
		$Character/character_sprite/AnimationPlayer.play("attack_left")
		Equipment_gd.get_equipment(chara,Main_gd.changing_eq)
		await get_tree().create_timer(0.65).timeout
		$AnimationPlayer.play("FadeOut")
		Main_gd.player_control = true
	pass
	
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
