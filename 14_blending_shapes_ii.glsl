//
// Use a polynomial smooth minimum (k = 0.1) to combine `d1`
// and `d2`.
//
float getDistanceFromPoint(vec3 point) {
  vec3 offset = vec3(0.25 * sin(iGlobalTime * 0.15), 0, 0);
  float d1 = length(point - offset) - 0.1;
  float d2 = length(point + offset) - 0.3;

  float h = clamp(0.5 + 0.5 * (d2 - d1) / 0.1, 0.0, 1.0);
  return mix(d2, d1, h) - 0.1 * h * (1.0 - h);
}
