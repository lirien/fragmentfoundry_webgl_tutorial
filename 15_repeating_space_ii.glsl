//
// Try and recreate the solution by eyeballing it :)
//
float getDistanceFromPoint(vec3 point) {
  float period = 0.4;
  float radius = 0.1;
  point = vec3(mod(point.x - period/2.0, period) - period / 2.0,
               point.y,
               mod(point.z - period/2.0, period) - period / 2.0);
  return length(point) - radius;
}
