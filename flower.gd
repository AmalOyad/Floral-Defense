extends CharacterBody2D

var speed = 500

func _ready():
	position = Vector2(520,500)
	
	
func _process(delta):
	velocity.x = 0
	if Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	elif Input.is_action_pressed("ui_right"):
		velocity.x = +speed
		
	
	move_and_slide()


