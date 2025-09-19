class_name Projectile
extends RigidBody2D


func _on_timer_timeout() -> void:
	queue_free()
