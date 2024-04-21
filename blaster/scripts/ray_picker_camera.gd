extends Camera3D

@export var grid_map: GridMap
@onready var ray_cast: RayCast3D = $ray_cast

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	var mouse_position: Vector2 = get_viewport().get_mouse_position()
	ray_cast.target_position = project_local_ray_normal(mouse_position) * 40.0
	ray_cast.force_raycast_update()

	if ray_cast.is_colliding():
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

		if Input.is_action_pressed("click"):
			var collider = ray_cast.get_collider()

			if collider is GridMap:
				var collision_point = ray_cast.get_collision_point()
				var cell = grid_map.local_to_map(collision_point)

				if grid_map.get_cell_item(cell) == 0:
					grid_map.set_cell_item(cell, 1)
	else:
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
