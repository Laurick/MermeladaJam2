shader_type canvas_item;

uniform float height = 1.5;
uniform float frequency = 1.3;
uniform float speed = 2.0;

void vertex() {
 VERTEX.y += height * sin((frequency * UV.x) + (speed * TIME));
}

void light() {
	// Called for every pixel for every light affecting the CanvasItem.
}
