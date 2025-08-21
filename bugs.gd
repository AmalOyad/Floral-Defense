extends Area2D

@export var speed := 100
var target: Node2D = null
var stopped := false

func _process(delta):
	if target and not stopped:
		var direction = (target.global_position - global_position).normalized()
		position += direction * speed * delta

func _on_area_entered(area):
	if area.is_in_group("flower") or area.name == "Flower":
		stopped = true
		speed = 0
