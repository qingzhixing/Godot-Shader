shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	float dist = abs(UV.y - UV.x);
	float loop = abs(sin(TIME))/4.0;
	while(dist >= loop)dist -= loop;
	if(dist <= 0.02){
		COLOR = vec4(0.2,0.2,0.0,1.0);
	}
}
