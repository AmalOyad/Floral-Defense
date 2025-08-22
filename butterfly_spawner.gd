extends Node2D

@export var butterfly_scene: PackedScene
@export var flower: Node2D
@export var spawn_delay_range := Vector2(2, 4)
@export var spawn_area: Rect2 = Rect2(0,0,1920,80)

var timer := 0.0
var next_spawn := 0.0

func _ready():
	randomize()
	set_next_spawn()

func _process(delta):
	timer += delta
	if timer >= next_spawn:
		spawn_butterfly()
		set_next_spawn()

func set_next_spawn():
	timer = 0
	next_spawn = randf_range(spawn_delay_range.x, spawn_delay_range.y)

func spawn_butterfly():
	for i in range(randi_range(2, 3)):
		var butterfly = butterfly_scene.instantiate()
		butterfly.global_position = Vector2(
			randf_range(spawn_area.position.x, spawn_area.position.x + spawn_area.size.x), 
			spawn_area.position.y + randf_range(0, 30)
		)
		butterfly.target = flower
		add_child(butterfly)
