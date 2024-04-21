extends Camera3D

@onready var ray_cast: RayCast3D = $ray_cast

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	var mouse_position: Vector2 = get_viewport().get_mouse_position()
	ray_cast.target_position = project_local_ray_normal(mouse_position) * 20.0
	ray_cast.force_raycast_update()
	
	printt(ray_cast.get_collider(), ray_cast.get_collision_point())
