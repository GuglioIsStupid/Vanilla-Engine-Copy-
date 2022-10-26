// so basically this is a shader that takes parts of the image and moves them around

extern number glitchAmount = 0.0;
			
// the higher glitchAmount is, the more rips will appear

vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
    vec2 texSize = vec2(1.0 / love_ScreenSize.x, 1.0 / love_ScreenSize.y);
	vec2 texCoords = texture_coords;
	vec4 pixel = Texel(texture, texCoords);
	number rip = 0.0;
	number ripAmount = 0.0;
	number ripSize = 0.0;
	number ripOffset = 0.0;
	number ripDirection = 0.0;
				
	// ripAmount is the amount of rips that will appear
	// ripSize is the size of the rips
	// ripOffset is the offset of the rips
	// ripDirection is the direction of the rips

	ripAmount = glitchAmount * 0.5;
	ripSize = 0.5 / (glitchAmount + 1.0);
	ripOffset = 0.5 / (glitchAmount + 1.0);
    ripDirection = 0.5 / (glitchAmount + 1.0);

	// rip is the amount of rips that will appear
	// it is calculated by multiplying ripAmount by a random number between 0 and 1
	// this is done to make the rips appear randomly

	rip = ripAmount * random(texture_coords);

	// if rip is greater than 0.5, then a rip will appear
				
	if (rip > 0.5) {
		// if ripDirection is greater than 0.5, then the rip will go up
		// otherwise, it will go down

		if (ripDirection > 0.5) {
			texCoords.y = texCoords.y + ripSize + ripOffset;
		} else {
			texCoords.y = texCoords.y - ripSize - ripOffset;
		}
	}

	// if the texture coordinates are out of bounds, then the pixel will be set to black
	// otherwise, it will be set to the pixel at the texture coordinates

	if (texCoords.x < 0.0 || texCoords.x > 1.0 || texCoords.y < 0.0 || texCoords.y > 1.0) {
		pixel = vec4(0.0, 0.0, 0.0, 1.0);
	} else {
		pixel = Texel(texture, texCoords);
	}

	return pixel * color;
}