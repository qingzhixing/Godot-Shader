@tool
extends ColorRect
@export var trinkleTime_s: float = 1;

var disappearing: bool = true;
var swtichedTime_s: float = 0;

func _process(delta: float) -> void:
	swtichedTime_s += delta;
	if swtichedTime_s >= trinkleTime_s:
		swtichedTime_s = 0;
		disappearing = !disappearing;
	
	var animateProgress: float = swtichedTime_s / trinkleTime_s;
	var alpha: float = animateProgress;
	if disappearing:
		alpha = 1 - animateProgress;
	
	material.set_shader_parameter("alpha", alpha);
