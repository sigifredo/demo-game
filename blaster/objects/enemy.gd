extends PathFollow3D

@export var speed: float = 2.5

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	progress += (speed * delta)
