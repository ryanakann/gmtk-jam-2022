extends RigidBody

signal clicked

var held = false
var p1
var cam
var c
var cf
var m1
var m2
var d1
var d2
var p2
var f
var fm = 10

func _input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			held = true
			p1 = transform.origin
			cam = get_viewport().get_camera()
			c = cam.global_transform.origin
			m1 = cam.project_position(get_viewport().get_mouse_position(), 1)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if held:
		m2 = cam.project_position(get_viewport().get_mouse_position(), 1)
		d1 = m1.distance_to(c)
		d2 = p1.distance_to(c)
		p2 = c + (m2 - c) * (d2 / d1)
		print(p2)
		f = (p2 - p1) * fm
		add_central_force(f)
		
		p1 = transform.origin
		cam = get_viewport().get_camera()
		c = cam.global_transform.origin
		m1 = cam.project_position(get_viewport().get_mouse_position(), 1)
		
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if held:
		release_if_able()

func release_if_able():
	if Input.is_action_just_released("throw"):
			held = false
