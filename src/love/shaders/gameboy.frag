extern number greenValue; // value between 0 and 1
vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords)
{
	/*vec4 pixel = Texel(texture, texture_coords);
	// make the pixel green
	pixel.r = 0.0;
	pixel.b = 0.0;
	return pixel;
	*/
	vec4 pixel = Texel(texture, texture_coords);
	// as the greenValue increases, the pixel will become more green
	pixel.r = pixel.r * (1.0 - greenValue);
	pixel.b = pixel.b * (1.0 - greenValue);
	return pixel;
}