extends Node

@onready var tile_map: TileMap = $TileMap

func _process(delta):
	var mouse_pos: Vector2 = tile_map.get_global_mouse_position()
	var local_mouse_pos: Vector2 = tile_map.to_local(mouse_pos)
	var tile_map_pos: Vector2i = tile_map.local_to_map(local_mouse_pos)
	var tileSource = tile_map.get_cell_source_id(0, tile_map_pos)
	if Input.is_action_just_pressed("interact"):
		print("Right-click detected")

		print(tileSource)

		if tileSource == 2 and tile_map.get_cell_atlas_coords(0, tile_map_pos) == Vector2i(1, 0):
			tile_map.set_cell(0, tile_map_pos, 3, Vector2i(1, 0))
		elif tileSource == 2 and tile_map.get_cell_atlas_coords(0, tile_map_pos) == Vector2i(0, 0):
			tile_map.set_cell(0, tile_map_pos, 3, Vector2i(0, 0))
		elif tileSource == 2 and tile_map.get_cell_atlas_coords(0, tile_map_pos) == Vector2i(2, 0):
			tile_map.set_cell(0, tile_map_pos, 3, Vector2i(2, 0))
			
			print("Mouse Position (global):", mouse_pos)
		print("Mouse Position (local to tilemap):", local_mouse_pos)
		print("Tile Map Position:", tile_map_pos)
# first plant implementation with beetrot
	if Input.is_action_just_pressed("plant"):
		if tileSource == 3 and tile_map.get_cell_atlas_coords(0, tile_map_pos) == Vector2i(1,0):
			tile_map.set_cell(0, tile_map_pos, 4, Vector2i(1,0), 0)
			await get_tree().create_timer(randi_range(30, 180)).timeout
			tile_map.set_cell(0, tile_map_pos, 1, Vector2i(1,0), 0)
			
		elif tileSource == 3 and tile_map.get_cell_atlas_coords(0,tile_map_pos) == Vector2i(0,0):
			tile_map.set_cell(0, tile_map_pos, 4, Vector2i(0,0), 0)
			await get_tree().create_timer(randi_range(30, 180)).timeout
			tile_map.set_cell(0, tile_map_pos, 1, Vector2i(0,0), 0)
			
		elif tileSource == 3 and tile_map.get_cell_atlas_coords(0,tile_map_pos) == Vector2i(2,0):
			tile_map.set_cell(0, tile_map_pos, 4, Vector2i(2,0), 0)
			await get_tree().create_timer(randi_range(30, 180)).timeout
			tile_map.set_cell(0, tile_map_pos, 1, Vector2i(2,0), 0)
