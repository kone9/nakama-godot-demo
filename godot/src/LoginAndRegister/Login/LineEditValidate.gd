# Line edit with the ability to validate the content.
class_name LineEditValidate
extends LineEdit

var focus_normal: StyleBoxFlat = preload("res://assets/theme/stylebox/button_focused.tres")
var focus_error: StyleBoxFlat = preload("res://assets/theme/stylebox/button_focused_error.tres")

var is_valid := true setget set_is_valid


func _ready() -> void:
# warning-ignore:return_value_discarded
	connect("text_changed", self, "_on_text_changed")


# Returns `true` if the text input is valid.
# @tags - virtual
func _validate(_text: String) -> bool:
	return true


func set_is_valid(value: bool) -> void:
	is_valid = value
	if is_valid or text == "":
		set("custom_styles/focus", focus_normal)
	else:
		set("custom_styles/focus", focus_error)


func _on_text_changed(new_text: String) -> void:
	self.is_valid = _validate(new_text)
