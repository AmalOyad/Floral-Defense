extends Node2D

@onready var hearts_ui = $"../UI/Hearts"
var hearts = 5

func lose_heart():
	score -= 3
	update_score()
	hearts -= 1
	print("Hearts left: ", hearts)
	
	if hearts_ui.get_child_count() > 0:
		var heart_node = hearts_ui.get_child(hearts)
		heart_node.visible = false
	
	if hearts <= 0:
		game_over()
	
func game_over():
	get_tree().change_scene_to_file("res://gameOver.tscn")
	

func win():
	if score == 100:
		print("You Win!") # Add the pop up for game over - you win here
		for bug in get_tree().get_nodes_in_group("bugs"):
			bug.speed = 0
		for butterfly in get_tree().get_nodes_in_group("butterflies"):
			butterfly.speed = 0

func gain_heart():
	score += 5
	update_score()
	if hearts < 5:
		var heart_node = hearts_ui.get_child(hearts)
		heart_node.visible = true
		hearts += 1
		print("Hearts left: ", hearts)

var score = 0
@onready var score_label = $"../UI/Scorelabel"

func update_score():
	if score_label:
		score_label.text = str(score)

func add_score(points):
	score += points
	update_score()
	win()

func subtract_score(points):
	score -= points
	update_score()
	win()
