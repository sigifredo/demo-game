extends RigidBody3D

# exported variables
## How much vertical force to apply when moving
@export_range(750.0, 3000.0) var thrust: float = 1000.0
## Torque angle when player is in the air
@export var torque_thrust: float = 100.0

# private variables
var is_transitioning: bool = false

func _ready():
	pass

func _process(delta: float) -> void:
	if Input.is_action_pressed('boost'):
		apply_central_force(basis.y * delta * thrust)

	if Input.is_action_pressed('rotate_left'):
		apply_torque(Vector3(0.0, 0.0, torque_thrust) * delta)

	if Input.is_action_pressed('rotate_right'):
		apply_torque(Vector3(0.0, 0.0, -torque_thrust) * delta)

func _on_body_entered(body: Node) -> void:
	if not is_transitioning:
		if 'Goal' in body.get_groups():
			print(body.file_path)
			complete_level(body.file_path)
		elif 'Hazard' in body.get_groups():
			crash_sequence()

func crash_sequence() -> void:
	set_process(false)
	is_transitioning = true
	var tween = create_tween()
	tween.tween_interval(1)
	tween.tween_callback(get_tree().reload_current_scene)

func complete_level(next_level_file: String) -> void:
	print('Level completed')
	var tween = create_tween()
	tween.tween_interval(1)
	tween.tween_callback(get_tree().change_scene_to_file.bind(next_level_file))
