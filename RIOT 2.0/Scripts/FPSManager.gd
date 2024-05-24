extends Camera3D

@export var nextweapon = Node
@export var currentweapon = Node
@onready var playerentity = $"../../Entity"
@onready var inventory = $Inventory
@onready var player_ui = $PlayerUI
@onready var entity = $"../../Entity"

var Ray_Range = 1000

func _ready():
	print("Player and inventory linked")
	entity.entity_resource.changed.connect(_on_resource_data_change)
	Initialize() #enter state machine
	#print(str(currentweapon) + "&" + str(nextweapon))

func Initialize():
	currentweapon = inventory.userweapon1
	nextweapon = inventory.userweapon2
	player_ui.weapon_name.append_text(str(currentweapon))
	player_ui.healthlabel.append_text("Health: " + str(playerentity.entity_resource.health))
	for child in inventory.get_children():
		if child != currentweapon:
			child.visible = false

func _input(event):
	if event.is_action_pressed("shoot"):
		Get_Camera_Collision()
		if null:
			pass
		
	if event.is_action_pressed("reload"):
		pass
	if Input.is_action_pressed("weapon_down"):
		nextweapon.visible = true
		currentweapon.visible = false
		var temp = currentweapon
		currentweapon = nextweapon
		nextweapon = temp
		player_ui.weapon_name.clear()
		player_ui.weapon_name.append_text(str(currentweapon))
	if Input.is_action_pressed("weapon_up"):
		nextweapon.visible = true
		currentweapon.visible = false
		var temp = currentweapon
		currentweapon = nextweapon
		nextweapon = temp
		player_ui.weapon_name.clear()
		player_ui.weapon_name.append_text(str(currentweapon))

func Get_Camera_Collision():
	var center = get_viewport().get_size()/2
	
	var Ray_Origin = project_ray_origin(center)
	var Ray_End = Ray_Origin + project_ray_normal(center)*Ray_Range
	
	var New_Intersection = PhysicsRayQueryParameters3D.create(Ray_Origin, Ray_End)
	var Intersection = get_world_3d().direct_space_state.intersect_ray(New_Intersection)
	
	if not Intersection.is_empty():
		if Intersection.collider.find_child("TakeDamage"):
			print(Intersection.collider.name)
			Intersection.collider.find_child("TakeDamage").execute()
		
	else:
		print("Nothing")

func _on_resource_data_change():
	player_ui.healthlabel.text = str(str(entity.entity_resource.health))
