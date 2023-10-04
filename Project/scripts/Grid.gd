extends Node2D

var max = 8

# Called when the node enters the scene tree for the first time.
func _ready():
	var x = 0
	var y = 0
	for i in range(0,max):
		var linex = Line2D.new()
		linex.add_point(Vector2i(x*64,0))
		linex.add_point(Vector2i(x*64,max*64))
		linex.width = 1
		linex.default_color = Color(255,255,255,0.2)
		linex.z_index = 1
		add_child(linex)
		
		var liney = Line2D.new()
		liney.add_point(Vector2i(0,y*64))
		liney.add_point(Vector2i(max*64,y*64))
		liney.width = 1
		liney.default_color = Color(255,255,255,0.2)
		liney.z_index = 1
		add_child(liney)
		
		x += 1
		y += 1
