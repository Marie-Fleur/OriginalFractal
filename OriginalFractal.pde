

void setup() {
  size(700,500);
  background(255);
}

void draw() {
  stroke(0);
  drawCircle(width/2, height/2, 300);
}

void drawCircle(float x, float y, float radius) {
  fill((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
  ellipse(x, y, radius, radius);
  if (radius > 2) {
    drawCircle(x+radius/2,y,radius/2);
    drawCircle(x-radius/2,y,radius/2);
  }
}
