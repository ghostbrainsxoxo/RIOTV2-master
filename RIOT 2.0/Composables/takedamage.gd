class_name TakeDamage extends Node

func execute():
	owner.enemyresource.health = owner.enemyresource.health - 10
	print(owner.enemyresource.health)
	pass
