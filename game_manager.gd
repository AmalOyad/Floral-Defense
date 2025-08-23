extends Node2D

@onready var hearts_ui = $"../UI/Hearts"
var hearts = 5

func lose_heart():
	score -= 3
	update_score()
	hearts -= 1
	print("Hearts left: ", hearts)
	
	SFX.play()
	
	if hearts_ui.get_child_count() > 0:
		var heart_node = hearts_ui.get_child(hearts)
		heart_node.visible = false
	
	if hearts <= 0:
		game_over()
	
func game_over():
	Bgmusic.stop()
	SFX.play()
	get_tree().change_scene_to_file("res://gameOver.tscn")
	

func win():
	if score >= 100:
		print("You Win!")
		get_tree().change_scene_to_file("res://win.tscn")

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
