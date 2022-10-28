extern number value;
extern number greenscale; // 0-1
uniform vec3 COLOR_MASKS[ 4 ];
vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 pixel_coords){
	vec4 pixel = Texel(texture, texture_coords);
	float avg = min(0.9999,max(0.0001,(pixel.r + pixel.g + pixel.b)/3));
	int index = int(avg*4);
	// higher greenscale is, the more the color is shifted towards green
	pixel.r = COLOR_MASKS[index][0] * (1-greenscale) + pixel.r * greenscale;
	pixel.g = COLOR_MASKS[index][1] * (1-greenscale) + pixel.g * greenscale;
	pixel.b = COLOR_MASKS[index][2] * (1-greenscale) + pixel.b * greenscale;
	pixel.a = pixel.a;
	return  pixel;
}