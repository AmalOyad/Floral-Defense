extends Sprite2D


@export var speed: float = 50.0
@export var flutter_amplitude: float = 10.0
@export var flutter_speed: float = 8.0
@export var move_distance: float = 100.0

var direction: int = 1
var start_position: Vector2
var time_passed: float = 0.0

func _ready():
	start_position = position

func _process(delta: float):
	time_passed += delta
	
	# Horizontal left-right movement
	position.x += direction * speed * delta
	
	# Check if we reached the edge of allowed distance
	if abs(position.x - start_position.x) >= move_distance:
		direction *= -1  # flip direction
	
	# Fluttering effect (up and down using sine wave)
	position.y = start_position.y + sin(time_passed * flutter_speed) * flutter_amplitude
