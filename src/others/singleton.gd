extends Node

signal score_updated(score: int)
signal lives_updated(lives: int)


var lives: int = 2:
	set(v):
		lives = v
		lives_updated.emit(lives)
var score: int = 0:
	set(v):
		score = v
		score_updated.emit(score)
