#define PI 3.14159265358979323846

float getDistanceFromPoint(vec3 point) {
  vec3 offset = vec3(0.75, 0, 0) * abs(sin(iGlobalTime * 0.1));
  float radius = 0.1;

  vec3 offset2 = vec3(offset.x * cos(2.0 * PI / 5.0), 0, offset.x * sin(2.0 * PI / 5.0));
  vec3 offset3 = vec3(offset.x * cos(4.0 * PI / 5.0), 0, offset.x * sin(4.0 * PI / 5.0));
  vec3 offset4 = vec3(offset.x * cos(6.0 * PI / 5.0), 0, offset.x * sin(6.0 * PI / 5.0));
  vec3 offset5 = vec3(offset.x * cos(8.0 * PI / 5.0), 0, offset.x * sin(8.0 * PI / 5.0));

  vec3 p1 = point - offset;
  vec3 p2 = point - offset2;
  vec3 p3 = point - offset3;
  vec3 p4 = point - offset4;
  vec3 p5 = point - offset5;

  float d1 = length(p1) - radius;
  float d2 = length(p2) - radius;
  float d3 = length(p3) - radius;
  float d4 = length(p4) - radius;
  float d5 = length(p5) - radius;

  float min_d1_d2 = min(d1, d2);
  float min_d3_d4 = min(d3, d4);

  float min_d3_d4_d5 = min(min_d3_d4, d5);

  return min(min_d1_d2, min_d3_d4_d5);
}
