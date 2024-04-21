extends Node3D

@export var max_health: int = 5
@onready var label: Label3D = $label

var current_health: int:
	set(new_health):
		current_health = new_health

		if current_health < 1:
			get_tree().reload_current_scene()

		label.text = str(current_health) + '/' + str(max_health)
		label.modulate = Color.RED.lerp(Color.WHITE, 1.0 * current_health / max_health)

func _ready() -> void:
	current_health = max_health

func _process(delta: float) -> void:
	pass

func take_damage() -> void:
	print('damage dealt to base!')
	current_health -= 1
