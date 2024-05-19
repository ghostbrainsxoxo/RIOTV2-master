@tool
extends Node3D
@onready var textname = $EnemyDataLabel
@onready var enemy_mesh = $EnemyMesh
@export var enemyresource: Resource

var gravity = 9.8


# Called when the node enters the scene tree for the first time.
func _ready():
	load_enemy()
	enemyresource.changed.connect(_on_resource_data_change)

func load_enemy():
	enemy_mesh.mesh = enemyresource.mesh
	textname.text = str(enemyresource.enemy_name + "\n Health: " + str(enemyresource.health))
	print(textname.text)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_resource_data_change():
	textname.text = str(enemyresource.enemy_name + "\n Health: " + str(enemyresource.health))
	if enemyresource.health == 0:
		queue_free()
	pass
