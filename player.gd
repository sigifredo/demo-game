extends RigidBody3D

# exported variables
## How much vertical force to apply when moving
@export_range(750.0, 3000.0) var thrust: float = 1000.0
## Torque angle when player is in the air
@export var torque_thrust: float = 100.0

# private variables


func _ready():
	pass

func _process(delta: float):
	if Input.is_action_pressed('boost'):
		apply_central_force(basis.y * delta * thrust)

	if Input.is_action_pressed('rotate_left'):
		apply_torque(Vector3(0.0, 0.0, torque_thrust) * delta)

	if Input.is_action_pressed('rotate_right'):
		apply_torque(Vector3(0.0, 0.0, -torque_thrust) * delta)

func _on_body_entered(body: Node):
	if 'Goal' in body.get_groups():
		print('you win')
	elif 'Hazard' in body.get_groups():
		print('you fail')

func crash_sequence():
	pass
