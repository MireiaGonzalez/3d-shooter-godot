extends Node3D

@export var weapon_1: Node3D
@export var weapon_2: Node3D
@export var weapon_3: Node3D

func _ready() -> void:
	equip(weapon_1)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("weapon_1"):
		equip(weapon_1)
	if event.is_action_pressed("weapon_2"):
		equip(weapon_2)
	if event.is_action_pressed("weapon_3"):
		equip(weapon_3)
	if event.is_action_pressed("next_weapon"):
		next_weapon()
	if event.is_action_pressed("previous_weapon"):
		previous_weapon()

func equip(active_weapon: Node3D) -> void:
	for child in get_children():
		if child == active_weapon:
			child.visible = true
			child.set_process(true)
			child.ammo_handler.update_ammo_label(child.ammo_type)
		else:
			child.visible = false
			child.set_process(false)

func cycle_weapon(index: int) -> void:
	var weapon_index = wrapi(index, 0, get_child_count())
	equip(get_child(weapon_index))

func next_weapon() -> void:
	var current_index = get_current_index()
	cycle_weapon(current_index + 1)

func previous_weapon() -> void:
	var current_index = get_current_index()
	cycle_weapon(current_index - 1)

func get_current_index() -> int:
	for index in get_child_count():
		if get_child(index).visible:
			return index
	return 0
