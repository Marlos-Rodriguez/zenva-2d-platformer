extends Area2D

@export var value: int = 1

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.add_score(value)
		queue_free()
