extends Area2D

@export var move_speed:float = 100
@export var target_marker:Marker2D

var start_position:Vector2
var target_position: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	start_position = global_position
	target_position = target_marker.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = global_position.move_toward(target_position, move_speed * delta)
	if global_position == target_position:
		target_position = start_position
		start_position = global_position
			


func _on_body_entered(body):
	if body.is_in_group("player"):
		body.damage.emit()
