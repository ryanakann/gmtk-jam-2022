extends KinematicBody

# Declare member variables here. Examples:
var velocity = Vector3.ZERO
export var move_speed = 5
export var fall_acceleration = 75

func _physics_process(delta):
	velocity.y -= fall_acceleration * delta
	velocity = move_and_slide(velocity, Vector3.UP)	

func _get_input():
	var horizontal = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var vertical = Input.get_action_strength("move_forward") - Input.get_action_strength("move_back")
	var move_direction = Vector3(horizontal, velocity.y, vertical)
	print(move_direction)
	velocity = move_direction.normalized() * move_speed
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_get_input()
