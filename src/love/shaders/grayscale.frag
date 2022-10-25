extern number grayScale; // value between 0 and 1

vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
    vec4 pixel = Texel(texture, texture_coords );//This is the current pixel color
    // if grayScale != 1
    if (grayScale != 0) {
        // pixel.rgb = vec3(0.2126 * pixel.r + 0.7152 * pixel.g + 0.0722 * pixel.b);
        // as grayScale goes from 0 to 1, we want to interpolate between the original pixel color and the grayscale color
        pixel.rgb = mix(pixel.rgb, vec3(0.2126 * pixel.r + 0.7152 * pixel.g + 0.0722 * pixel.b), grayScale);
    }
    return pixel * color;
}    