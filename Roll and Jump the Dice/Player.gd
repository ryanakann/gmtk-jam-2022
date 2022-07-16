extends KinematicBody

# Declare member variables here. Examples:
var velocity = Vector3.ZERO
export var move_speed = 5
export var fall_acceleration = 75

func _physics_process(delta):
	var input = get_input()
	var target_vel = Vector3(input.x,velocity.y-fall_acceleration*delta,input.z)
	velocity = move_and_slide(target_vel, Vector3.UP)

func get_input():
	var horizontal = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var vertical = Input.get_action_strength("move_back") - Input.get_action_strength("move_forward")
	var move_direction = Vector3(horizontal, 0, vertical)
	return move_direction.normalized() * move_speed
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
