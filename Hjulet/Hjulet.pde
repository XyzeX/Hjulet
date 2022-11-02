float x = 0;
float rotation = 0;

int spokes = 2;
int oldSpokes = -1;

final int bgcolor = 200;
final int diameter = 400;

void setup() {
  size(1280, 720);
}

void draw() {
  background(bgcolor);
  
  wheel(x * diameter / 2 - diameter / 2, height / 2, diameter, spokes, rotation);
  if (x * diameter / 2 < diameter && oldSpokes >= 0) {
    wheel(x * diameter / 2 - diameter / 2 + width, height / 2, diameter, oldSpokes, rotation);
  }
  
  x += PI / 360 * 2;
  rotation += PI / 360 * 2;
  if (x * diameter / 2 > width) {
    x = 0;
    oldSpokes = spokes;
    spokes += 1;
  }
}

void wheel(float startX, float startY, int diameter, int spokes, float rads) {
  strokeWeight(1);
  fill(50);
  circle(startX, startY, diameter);
  fill(bgcolor);
  circle(startX, startY, diameter * 0.9);
  
  fill(35);
  strokeWeight(8);
  for (int i = 1; i < spokes + 1; i++) {
    line(startX + cos(rads + i * 2*PI / spokes) * diameter / 10, startY + sin(rads + i * 2*PI / spokes) * diameter / 10,
      startX + cos(rads + i * 2*PI / spokes) * diameter * 0.45, startY + sin(rads + i * 2*PI / spokes) * diameter * 0.45);
  }
  
  strokeWeight(1);
  fill(75);
  circle(startX, startY, diameter / 5);
}
