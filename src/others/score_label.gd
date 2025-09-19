extends Label


func _ready() -> void:
	Singleton.score_updated.connect(_on_score_updated)


func _on_score_updated(score: int) -> void:
	text = str(score)
