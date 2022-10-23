vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
    // slowly make the screen fade to black
    color.a = color.a * (1.0 - (time / 10.0));
    return color;
}