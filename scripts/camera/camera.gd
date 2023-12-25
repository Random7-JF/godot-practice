extends Camera2D
@export var tilemap: TileMap
@export var tilesize = 0

func _ready():
	limit_right = (tilemap.get_used_rect()).size[0] * tilesize

