class_name DamageArea extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Signal handler for when a body enters the Area3D
func _on_body_entered(body):
	if body.find_child("TakeDamage"):
		body.find_child("TakeDamage").execute()
