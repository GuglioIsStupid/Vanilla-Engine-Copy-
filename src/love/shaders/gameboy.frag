extern number value;
uniform vec3 COLOR_MASKS[ 4 ];
vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 pixel_coords){
	vec4 pixel = Texel(texture, texture_coords);
	float avg = min(0.9999,max(0.0001,(pixel.r + pixel.g + pixel.b)/3));
	int index = int(avg*4);
	pixel.r = COLOR_MASKS[index][0];
	pixel.g = COLOR_MASKS[index][1];
	pixel.b = COLOR_MASKS[index][2];
	return  pixel;
}