extends Node2D

# List of butterfly scenes (PackedScene resources)
@export var butterfly_scenes: Array[PackedScene]

func _ready():
	spawn_random_butterfly()

func spawn_random_butterfly():
	if butterfly_scenes.is_empty():
		return
	
	var random_index = randi() % butterfly_scenes.size()
	var butterfly_scene = butterfly_scenes[random_index]
	var butterfly = butterfly_scene.instantiate()
	
	add_child(butterfly)
	butterfly.position = Vector2(0, 0) # change spawn position if needed
