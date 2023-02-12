float scale = 1;
int STARTX = 350;
int STARTY = 350;
int FIBO = 20;

void setup() {
  size(700,700);
  stroke(0);
frameRate(15);
}

void draw() {
background(255);
FiboState fs = fibo (FIBO);
if (scale < 0.14) scale = 1;
scale *= 0.99;
}

FiboState fibo(int n) {
  if (n == 1) {
    rect (STARTX, STARTY, 1, 1);
    return new FiboState(STARTX + 1, STARTY + 1, 0, 1);
  } else if (n == 0) {
    return new FiboState(0, 0, 0, 0);
  }
  FiboState previous = fibo(n-1);
  FiboState ante = fibo(n-2);
  int direction = (previous.myDirection + 1) % 4;
  int len = previous.myLen + ante.myLen;
  int lenPixel = (int) (len * scale);
  int x, y;
  if (direction == 0) {
   rect (previous.myX, previous.myY, lenPixel, lenPixel);
   x = previous.myX + lenPixel;
   y = previous.myY + lenPixel;
  } else if (direction == 1) {
   rect (previous.myX, previous.myY - lenPixel, lenPixel , lenPixel);
   x = previous.myX + lenPixel;
   y = previous.myY - lenPixel;
  } else if (direction == 2) {
   rect (previous.myX - lenPixel, previous.myY - lenPixel, lenPixel, lenPixel);
   x = previous.myX - lenPixel;
   y = previous.myY - lenPixel;
  } else {
   rect (previous.myX - lenPixel, previous.myY, lenPixel, lenPixel);
   x = previous.myX - lenPixel;
   y = previous.myY + lenPixel;
  }
  return new FiboState(x, y, direction, len);
}


class FiboState {
  public int myX, myY, myDirection, myLen;
  public FiboState(int x, int y, int direction, int len) {
    myX = x;
    myY = y;
    myDirection = direction;
    myLen = len;
  }
  public String toString() {
    return myX + " " + myY + " " + myDirection + " " + myLen;
  }
}

void keyPressed() {
  if (key == 'c') {
    scale *= 0.95;
    System.out.println(scale);
    redraw();
  } else if (key == 'x') {
    scale *= 1.05;
    redraw();
  }
}
