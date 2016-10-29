//
// Using one of the techniques you learnt previously, combine
// `d1`, `d2`, `d3` and `d4` into a single 3D shape.
//
float getDistanceFromPoint(vec3 point) {
  vec3 offset = vec3(0.25, 0, 0);
  float radius = 0.3;
  float d1 = length(point - offset.xyz) - radius;
  float d2 = length(point + offset.xyz) - radius;
  float d3 = length(point - offset.zyx) - radius;
  float d4 = length(point + offset.zyx) - radius;

  float min_d1_d2 = min(d1,d2);
  float min_d3_d4 = min(d3,d4);

  return min(min_d1_d2, min_d3_d4);
}
