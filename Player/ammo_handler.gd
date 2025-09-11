class_name AmmoHandler extends Node

@export var ammo_label: Label

enum ammo_type {
	BULLET,
	SMALL_BULLET,
	PISTOL_BULLETS
}

var ammo_storage := {
	ammo_type.BULLET: 10,
	ammo_type.SMALL_BULLET: 60,
	ammo_type.PISTOL_BULLETS: 100
}

func has_ammo(bullet_type: ammo_type) -> bool:
	return ammo_storage[bullet_type] > 0

func use_ammo(bullet_type: ammo_type) -> void:
	if has_ammo(bullet_type):
		ammo_storage[bullet_type] -= 1
	update_ammo_label(bullet_type)

func update_ammo_label(bullet_type: ammo_type) -> void:
	ammo_label.text = str(ammo_storage[bullet_type])
