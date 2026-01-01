extends Node2D

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
	$Timer.start(randf_range(2.0, 5.0))

func spawn():
	var type = randi()%3
	var spawn_y = randf_range(-100, 100)
	var enemy = enemy_base.instantiate()
	enemy.damage_type = type
	enemy.transform = enemy.transform.translated_local(Vector2(0, spawn_y))
	add_child(enemy)
