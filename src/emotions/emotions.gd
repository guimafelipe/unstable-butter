extends Node

const EMOTION_CAP = 100.0
var emotions: Array[float] = []

func _ready():
	var num_emotions = Constants.EMOTIONS.size()
	emotions.resize(num_emotions)

func increase_emotion(emotion: Constants.EMOTIONS, amount: float):
	emotions[emotion] += amount
	if emotions[emotion] >= EMOTION_CAP:
		print("Game over")
	
