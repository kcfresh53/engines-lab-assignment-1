extends Control


func _input(_event: InputEvent) -> void:
	if Input.is_anything_pressed():
		get_tree().change_scene_to_file("res://src/levels/game.tscn")
