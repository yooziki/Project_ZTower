extends Node

class Role:
	extends Object
	var HP: int
	var ATT: int
	var DEF: int
	var SPD: int
	var DOG: int
	var CRI: int
	var name: String

class Monster:
	extends Role
	func _init(floor,template):
		print("创建 Monster："+name)
		pass
	
	func putOnMap():
		var sprite = Sprite2D.new()
		var icon = preload("res://assets/character/rpg-character.png")
		sprite.set_texture(icon)
		sprite.position.x = 200
		sprite.position.y = 200
		return sprite
	
class Player:
	extends Role
	var LUCK: int
	func _init(HP,ATT,DEF,SPD,LUCK,DOG,CRI):
		print("创建 Player："+name)
		self.HP = HP
		self.ATT = ATT
		self.DEF = DEF
		self.SPD = SPD
		self.LUCK = LUCK
		self.DOG = DOG
		self.CRI = CRI
	




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
