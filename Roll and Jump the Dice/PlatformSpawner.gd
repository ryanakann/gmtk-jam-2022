extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var floor_prefab = ResourceLoader.load("res://Floor.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(10):
		var new_floor = floor_prefab.instance()
		get_node(".").add_child(new_floor)
		new_floor.transform = new_floor.transform.translated(Vector3(0,0,i*-15))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
