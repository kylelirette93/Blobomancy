class_name Player extends CharacterBody2D

@export var speed : float = 400
@export var jump_force: float = 400
@export var dash_force: float = 2500

var gravity : Vector2
var input_direction: float


var is_dashing: bool = false
var timer: float = 0.0
var dash_cooldown: float = 1.2
var can_dash: bool = true

func apply_gravity(delta: float) -> void:
	# Get gravity and apply to velocity, don't apply gravity while dashing.
	if not is_dashing:
		gravity = get_gravity() * delta
		velocity.x += gravity.x
		velocity.y += gravity.y

func get_input():
	# Get input axis for left and right direction.
	input_direction = Input.get_axis("move_left", "move_right")
	# Apply horizontal input to velocity.
	velocity.x = input_direction * speed
	# Handle jump press if the player is grounded.
	if (is_grounded()):
		if Input.is_action_just_pressed("jump"):
			jump()
	if Input.is_action_just_pressed("dash"):
		dash()

func is_grounded() -> bool:
	# Check if player is grounded or not.
	if (is_on_floor()):
		return true
	else:
		return false

func _physics_process(delta: float) -> void:
	timer += delta
	if timer >= dash_cooldown:
		can_dash = true
		timer = 0
	apply_gravity(delta)
	if not is_dashing:
		get_input()
	move_and_slide()

func jump():
	# Only jump if player is grounded.
	if (is_on_floor()):
	# Apply jump force against gravity.
		velocity.y -= jump_force - gravity.y

func dash():
	# Avoid consecutive dashes.
	if is_dashing:
		return
	if can_dash:
		is_dashing = true
		can_dash = false
	
		# Create a smooth dash tween using the x velocity.
		var dash_tween = create_tween()
		var dash_direction = input_direction
		if dash_direction == 0:
			dash_direction = 1
		velocity.x = dash_direction * dash_force
		velocity.y = 0
		dash_tween.tween_property(self, "velocity:x", 0.0, 0.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
		dash_tween.tween_callback(Callable(self, "_on_dash_finished"))

func _on_dash_finished():
	# When the dash is finished, reset flag.
	is_dashing = false
