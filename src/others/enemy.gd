extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# always move left
	velocity.x = move_toward(-1 * 20, 0, SPEED)

	move_and_slide()


func _on_coll_body_entered(body: Node2D) -> void:
	body.queue_free()
	Singleton.score += 10
	queue_free()
