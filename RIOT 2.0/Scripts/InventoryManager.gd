# InitClass.gd
@tool
extends Node3D

@export var CLASS: classes

var weapon_scene = load("res://weapons/weapon.tscn")

@export var userweapon1: Node
@export var userweapon2: Node

func _ready():
	load_class()

func set_class(value):
	CLASS = value
	if Engine.is_editor_hint():
		load_class()

func load_class():
	if not CLASS:
		print("CLASS is not set.")
		return

	# Remove existing children to prevent duplicates
	for child in get_children():
		remove_child(child)
		child.queue_free()
		
	# Instantiate weapon scenes
	userweapon1 = weapon_scene.instantiate()
	userweapon2 = weapon_scene.instantiate()
	
	#setting the instantiated node names to the class gun names
	userweapon1.name = CLASS.Weapon1.weapon_name
	userweapon2.name = CLASS.Weapon2.weapon_name
	
	#setting the metadata to the class weapon resources
	userweapon1.set_meta("weapon_type", CLASS.Weapon1)
	userweapon2.set_meta("weapon_type", CLASS.Weapon2)
	userweapon1.set_meta("weapon_name", CLASS.Weapon1.weapon_name)
	userweapon2.set_meta("weapon_name", CLASS.Weapon2.weapon_name)
	
	#setting weapon mesh(s) to match class mesh(s) 
	var userweapon1_mesh = userweapon1.get_node("WeaponMesh")
	userweapon1_mesh.mesh = CLASS.Weapon1.mesh
	var userweapon2_mesh = userweapon2.get_node("WeaponMesh")
	userweapon2_mesh.mesh = CLASS.Weapon2.mesh
	
	# Add weapon nodes as children to the inventory
	add_child(userweapon1)
	add_child(userweapon2)

	# Print to verify
	print(str(userweapon1.name) + " & " + str(userweapon2.name))
