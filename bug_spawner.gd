extends Node2D

@export var bug_scene: PackedScene
@export var flower: Node2D
@export var spawn_delay_range := Vector2(1, 3)
@export var spawn_area: Rect2 = Rect2(0,0,1920,50)

var timer := 0.0
var next_spawn := 0.0

func _ready():
	randomize()
	set_next_spawn()

func _process(delta):
	timer += delta
	if timer >= next_spawn:
		spawn_bug()
		set_next_spawn()

func set_next_spawn():
	timer = 0
	next_spawn = randf_range(spawn_delay_range.x, spawn_delay_range.y)

func spawn_bug():
	var bug = bug_scene.instantiate()
	bug.global_position = Vector2(
		randf_range(spawn_area.position.x, spawn_area.position.x + spawn_area.size.x), 
		spawn_area.position.y
	)
	bug.target = flower
	add_child(bug)
