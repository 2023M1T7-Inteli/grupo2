shader_type canvas_item;

uniform bool azul = false;
uniform float mix_weight = 1.0;

void fragment() {
	vec4 textura = texture(TEXTURE, UV);
	
	if (azul) {
		vec3 azulCor = vec3(0, 0.25, 1);
		vec3 textura_branca_rgb = mix(textura.rgb, azulCor, mix_weight);
		COLOR = vec4(textura_branca_rgb, textura.a);
	}
	else {
		COLOR = textura
	}
}