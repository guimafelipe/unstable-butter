class_name Enemy
extends Node2D

@export var speed = 60.0

var damage_type: Constants.EMOTIONS

func set_dagame_type(type: Constants.EMOTIONS) -> void:
	damage_type = type

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Added to the tree")
	print("Position " + str(transform.y))
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= speed*delta
