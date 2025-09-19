class_name Spawner
extends Marker2D

@export var scene: PackedScene

var _timer: Timer = Timer.new()


func _ready() -> void:
	add_child(_timer)
	_timer.start()
	_timer.timeout.connect(_on_timeout)


func _on_timeout():
	if not scene: return

	var x: Node = scene.instantiate()
	get_tree().get_current_scene().add_child(x)

	if x is Node2D:
		x.global_position = global_position
