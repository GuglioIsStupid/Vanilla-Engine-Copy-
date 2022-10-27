// slowly make the image bend in a wavy pattern from the middle and go left and right
extern number time;
extern number grayscale;
extern number waveAmount; // 0-1
vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords)
{
	vec2 offset = vec2(0.0, 0.0);
	offset.x = sin(screen_coords.y * 0.01 + time * 0.5) * waveAmount * 0.05;
	vec4 pixel = Texel(texture, texture_coords + offset) * color; //This is the current pixel color
	if (grayscale != 0) {
		// pixel.rgb = vec3(0.2126 * pixel.r + 0.7152 * pixel.g + 0.0722 * pixel.b);
		// as grayscale goes from 0 to 1, we want to interpolate between the original pixel color and the grayscale color
		pixel.rgb = mix(pixel.rgb, vec3(0.2126 * pixel.r + 0.7152 * pixel.g + 0.0722 * pixel.b), grayscale);
	}
	return pixel;
}