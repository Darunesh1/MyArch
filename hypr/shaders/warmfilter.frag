#version 300 es
precision mediump float;

in vec2 v_texcoord;
uniform sampler2D tex;
out vec4 fragColor;

void main() {
    vec4 pixColor = texture(tex, v_texcoord);

    // Warm blue-light filter — no dimming, just color shift
    pixColor.r *= 1.05;  // Slight red boost for warmth
    pixColor.g *= 0.95;  // Minimal green reduction
    pixColor.b *= 0.70;  // Moderate blue reduction

    // Clamp to valid range after red boost
    pixColor.rgb = clamp(pixColor.rgb, 0.0, 1.0);

    fragColor = pixColor;
}
