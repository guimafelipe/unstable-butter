class_name Enemy
extends Node2D

@export var speed = 60.0
signal emotion_trigerred(emotion: Constants.EMOTIONS, amount: float)

var damage_type: Constants.EMOTIONS
var damage_amount: float
var activated := false

func set_dagame_type(type: Constants.EMOTIONS) -> void:
	damage_type = type

func set_damage_amount(amount: float) -> void:
	damage_amount = amount

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Added to the tree")
	print("Position " + str(transform.y))
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= speed*delta

func _on_effect_area_body_entered(body: Node2D) -> void:
	if (not activated) and (body is Owner):
		activated = true
		emotion_trigerred.emit(damage_type, damage_amount)
		print("entrou")
