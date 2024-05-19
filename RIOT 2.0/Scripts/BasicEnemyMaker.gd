class_name Enemy extends Resource


@export var enemy_name: String
@export var mesh: Mesh

@export var health: int:
	set(_health):
		if _health != health:
			health = _health
			emit_changed()
	get:
		return health
