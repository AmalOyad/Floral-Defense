extends CharacterBody2D

var speed = 500

func _ready():
	position = Vector2(520,500)
	
	
func _process(_delta):
	velocity.x = 0
	if Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	elif Input.is_action_pressed("ui_right"):
		velocity.x = +speed
	if position > Vector2(1200,500):
		position = Vector2(0,500)
	elif position < Vector2(0,500):
		position = Vector2(1200,500)
	move_and_slide()
