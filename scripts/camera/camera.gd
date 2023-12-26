extends Camera2D
@export var tilemap: TileMap
@export var tilesize = 0

func _ready():
	set_camera_limits()
	
func set_camera_limits():
	var map_limits = tilemap.get_used_rect()
	var map_cellsize = Vector2(tilesize, tilesize)
	limit_left = map_limits.position.x * map_cellsize.x + tilesize
	limit_right = map_limits.end.x * map_cellsize.x
	limit_bottom = map_limits.end.y * map_cellsize.y
