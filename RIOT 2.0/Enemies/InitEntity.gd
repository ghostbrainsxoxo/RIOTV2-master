@tool
extends Node3D
@onready var textname = $EntityDataLabel
@onready var entity_mesh = $EntityMesh
@export var entity_resource: Resource


# Called when the node enters the scene tree for the first time.
func _ready():
	load_entity()
	entity_resource.changed.connect(_on_resource_data_change)

func load_entity():
	entity_mesh.mesh = entity_resource.mesh
	textname.text = str(entity_resource.entity_name + "\n Health: " + str(entity_resource.health))
	print(textname.text)

func _on_resource_data_change():
	textname.text = str(entity_resource.entity_name + "\n Health: " + str(entity_resource.health))
	if entity_resource.health == 0:
		queue_free()
	pass
