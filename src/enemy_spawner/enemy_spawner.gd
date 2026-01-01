extends Node2D

signal emotion_trigerred(emotion: Constants.EMOTIONS, amount: float)
var enemy_base = preload("res://src/base_enemy/base_enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.connect("timeout", on_timer_timeout)
	$Timer.start(2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_timer_timeout():
	spawn()
	$Timer.start(randf_range(2.0, 4.0))

func spawn():
	var type := randi()%3 as Constants.EMOTIONS
	var spawn_y = randf_range(-200, 200)
	var damage = randf_range(69.0, 99.9)
	var enemy : Enemy = enemy_base.instantiate()
	enemy.damage_type = type
	enemy.damage_amount = damage
	enemy.transform = enemy.transform.translated_local(Vector2(0, spawn_y))
	add_child(enemy)
	enemy.emotion_trigerred.connect(on_emotion_triggered)

func on_emotion_triggered(emotion: Constants.EMOTIONS, amount: float) -> void:
	print("deu trigger")
	emotion_trigerred.emit(emotion, amount)
