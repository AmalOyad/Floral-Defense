extends Area2D

@export var speed := 100
var target: Node2D = null
var stopped := false


func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			var gm = get_tree().get_root().get_node("mainscene/GameManager")
			gm.subtract_score(3)
			queue_free()

func _ready():
	target = get_tree().get_root().get_node("mainscene/Flower")
	add_to_group("butterflies")

func _process(delta):
	if target and not stopped:
		var direction = (target.global_position - global_position).normalized()
		position += direction * speed * delta

func _on_butterfly_body_entered(body: Node2D) -> void:
	print("Bug touched: ", body.name)
	if body.is_in_group("flower") or body.name == "Flower":
		var gm = get_tree().get_root().get_node("mainscene/GameManager")
		gm.gain_heart()
		queue_free()
