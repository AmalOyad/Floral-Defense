extends Node2D

@onready var hearts_ui = $"../UI/Hearts"
var hearts = 5

func lose_heart():
	hearts -= 1
	print("Hearts left: ", hearts)
	
	if hearts_ui.get_child_count() > 0:
		hearts_ui.get_child(hearts_ui.get_child_count() - 1).queue_free()
	
	if hearts <= 0:
		game_over()
	
func game_over():
	print("GAME OVER!")
