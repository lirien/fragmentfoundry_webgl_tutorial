uniform vec2 iResolution;
uniform float iGlobalTime;

//
// Blend two circles together using a polynomial smooth minimum,
// using a "smoothness" of 0.1
//
float distanceField(vec2 point, vec2 origin1, vec2 origin2, float radius) {
  float d1 = length(point - origin1) - radius;
  float d2 = length(point - origin2) - radius;
  float h = clamp(0.5 + 0.5 * (d2 - d1) / 0.1, 0.0, 1.0);
  return mix(d2, d1, h) - 0.1 * h * (1.0 - h);
  return min(d1, d2);
}

void main() {
  vec2 uv = 2.0 * gl_FragCoord.xy / iResolution.xy - 1.0;
  vec2 origin = vec2(sin(iGlobalTime * 0.11) * 0.3);
  float radius = (sin(iGlobalTime * 0.25) * 0.5 + 0.5) * 0.3 + 0.05;
  float dist = distanceField(uv, origin, -origin, radius);

  gl_FragColor = vec4(draw_distance(dist, uv), 1);
}
