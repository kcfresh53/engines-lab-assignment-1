extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@export var projectile: PackedScene

@onready var projectile_spawn_pos: Marker2D = $ProjectileSpawnPos


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed(&"attack"):
		var proj: Projectile = projectile.instantiate()
		projectile_spawn_pos.add_child(proj)

		var throw_force: float = 150
		proj.apply_impulse(Vector2(1, -1) * throw_force)


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_enemy_trigger_body_entered(_body: Node2D) -> void:
	Singleton.lives -= 1
	if Singleton.lives <= 0:
		Singleton.lives = 2
		get_tree().reload_current_scene()


func _on_pickup_trigger_area_entered(_area: Area2D) -> void:
	Singleton.score += 50
