extends CharacterBody2D

signal damage
signal score_signal(score:int)
var move_speed:float = 100.0
var jump_force:float = 200.0
var gravity:float = 500.0
var score:int = 0

@onready var camera = $Camera2D

func _ready():
	camera.set_position_smoothing_enabled(true)

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	camera.limit_bottom = 70
	camera.limit_left = -105
	camera.limit_right = 450
	velocity.x = 0
	
	if Input.is_key_pressed(KEY_LEFT):
		velocity.x -= move_speed 
	if Input.is_key_pressed(KEY_RIGHT):
		velocity.x += move_speed 
		
	if Input.is_key_pressed(KEY_SPACE) and is_on_floor():
		velocity.y -= jump_force
		
	move_and_slide()
	
	if position.y > 100.0:
		damage.emit()

func add_score(amount:int):
	score += amount
	score_signal.emit(score)
