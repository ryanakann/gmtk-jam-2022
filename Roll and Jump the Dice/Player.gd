extends KinematicBody

# Declare member variables here. Examples:
var velocity = Vector3.ZERO
export var move_speed = 5
export var fall_acceleration = 75
export var jump_power = 20

onready var ground_ray = get_node("RayCast")

func calculate_velocity_y(jump, delta):
	if (jump > 0 and ground_ray.is_colliding()):
		return jump_power
	else:
		return velocity.y - fall_acceleration * delta

func _physics_process(delta):
	var input = get_input()
	var target_y = calculate_velocity_y(input.y, delta)
	var target_vel = Vector3(input.x, target_y, input.z)
	velocity = move_and_slide(target_vel, Vector3.UP)

func get_input():
	var horizontal = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var vertical = Input.get_action_strength("move_back") - Input.get_action_strength("move_forward")
	var jump = int(Input.is_action_just_pressed("jump"))
	
	var move_direction = Vector3(horizontal, 0, vertical).normalized() * move_speed
	move_direction.y = jump
	return move_direction
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
