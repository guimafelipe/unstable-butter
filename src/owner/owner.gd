class_name Owner
extends CharacterBody2D

const SPEED = 60.0

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Up", "Down")
	if direction:
		velocity.y = direction * SPEED * delta
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED*delta)

	move_and_collide(velocity)
