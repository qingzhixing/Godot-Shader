shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

const vec2 center = vec2(0.5, 0.5);

void fragment() {
	float radius = abs(sin(TIME)/4.0)+0.1;
	float dist = distance(center, UV);
	float delta = dist - radius;
	if (delta <= 0.02 && delta>=-0.02) {	
		COLOR = vec4(0.2, 0.6, 0.2, 1.0);
	}
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
