extends Node


@onready var weapon_name = $VBoxContainer/weapon_name
@onready var ammo = $VBoxContainer/ammo
@onready var healthlabel = $VBoxContainer/health


@export var USERCLASS: classes


func _ready():
	weapon_name.clear()
	ammo.clear()
	healthlabel.clear()
