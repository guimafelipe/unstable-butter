extends AnimatableBody2D

const SPEED := 4.0

func _physics_process(delta: float) -> void:
	move_and_collide(Vector2(0,0))
