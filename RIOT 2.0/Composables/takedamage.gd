class_name TakeDamage extends Node


func execute():
	owner.entity_resource.health = owner.entity_resource.health - 10
	print(owner.entity_resource.health)
	pass
