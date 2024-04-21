extends Node3D

@export var max_health: int = 5
@onready var label: Label3D = $label

func _ready():
	label.text = str(max_health)

func _process(delta: float) -> void:
	pass

func take_damage() -> void:
	print('damage dealt to base!')
	max_health -= 1
	label.text = str(max_health)
