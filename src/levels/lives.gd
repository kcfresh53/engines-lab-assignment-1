extends Label


func _ready() -> void:
	_on_life_updated(Singleton.lives)
	Singleton.lives_updated.connect(_on_life_updated)


func _on_life_updated(life: int) -> void:
	text = str(life)
