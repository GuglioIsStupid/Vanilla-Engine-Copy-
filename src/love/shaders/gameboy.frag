// make all colours green
vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords)
{
	vec4 pixel = Texel(texture, texture_coords);
	// make the pixel green
	pixel.r = 0.0;
	pixel.b = 0.0;
	return pixel;
}