extends Node2D

@export var WEAPON_TYPE: Weapons
@onready var weapon_sprite: Sprite2D = $WeaponSprite

func _ready() -> void:
	# Ensure a new instance of weapon is created.
	WEAPON_TYPE = WEAPON_TYPE.duplicate(true)
	load_weapon()

func load_weapon() -> void:
	weapon_sprite.texture = WEAPON_TYPE.sprite
	position = WEAPON_TYPE.position
	
