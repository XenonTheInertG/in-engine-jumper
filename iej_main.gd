tool
extends EditorPlugin

var dock

func _enter_tree():
	dock = preload("res://addons/in-engine-jumper/Jumper_dock.tscn").instance()
	add_control_to_dock(EditorPlugin.DOCK_SLOT_RIGHT_BL, dock)


func _exit_tree():
	remove_control_from_docks(dock)
