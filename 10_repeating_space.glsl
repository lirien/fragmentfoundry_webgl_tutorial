uniform vec2 iResolution;
uniform float iGlobalTime;

//
// Modify `point` so that we get circles filling the screen.
// There should be one circle in each direction every 0.5 units,
// and the original circle should remain in the center of the screen.
//
float distanceFromCircle(vec2 point, float radius) {
  point = mod(point - 0.25, 0.5) - 0.25;
  return length(point) - radius;
}

void main() {
  vec2 uv = 2.0 * gl_FragCoord.xy / iResolution.xy - 1.0;
  float radius = (sin(iGlobalTime * 0.25) * 0.5 + 0.5) * 0.1 + 0.05;
  float dist = distanceFromCircle(uv, radius);

  gl_FragColor = vec4(draw_distance(dist, uv), 1);
}
