extends Node2D

@onready var score_text: Label = get_node("ScoreUI/ScoreText")

func game_over():
	get_tree().reload_current_scene()


func _on_player_damage():
	game_over()


func _on_player_score_signal(score:int):
	score_text.text = str(": ", score)
