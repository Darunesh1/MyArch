#version 300 es
precision mediump float;

in vec2 v_texcoord;
uniform sampler2D tex;
out vec4 fragColor;

void main() {
    // Note: texture2D is now just texture() in GLES 3.0
    vec4 pixColor = texture(tex, v_texcoord);

    // 1. Warm/Yellow tint (Blue light filter)
    pixColor.r *= 1.0;   // Keep reds high for warmth
    pixColor.g *= 0.85;  // Slightly reduce green
    pixColor.b *= 0.55;  // Heavily reduce blue to kill the harsh white light

    // 2. Extra dim effect (0.5 = 50% darker)
    float dim = 0.5; 
    pixColor.rgb *= dim;

    // Note: gl_FragColor is replaced by our custom out variable
    fragColor = pixColor;
}
