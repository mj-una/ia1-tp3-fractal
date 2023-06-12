// fractal blipip
// martin julio
// 12-6-23

float m, n;
color[] c;
int z = 0;

void setup() {
   
  m = height;
  c = new color[6];
  
  c[0] = color(0, 1);              // negro
  c[1] = color(255);            // blanco
  c[2] = color(239, 131, 142);  // rojo
  c[3] = color(7, 165, 219);    // azul
  c[4] = color(254, 216, 122);  // amarillo
  c[5] = color(149, 201, 150);  // verde

  size(800, 400);
  stroke(c[0]);
}

void draw() {
  push();
  background(155);
  translate(width / 2, height / 2);
  
  stroke(c[0]);
  strokeWeight(m / 200);
  
  if (mousePressed) {
    if (mouseButton == LEFT) z++;
    if (mouseButton == RIGHT) z--;
  }
  
  scale(z / 50.0 + 1);
  
  fill(c[4]);

  for (int n = 9; n > 0; n--) {
    boolean col;
    if (n % 2 == 0) col = true;
    else col = false;
    
    central(pow(3, n - 4) * 0.1, col);
  }
  pop();
  fill(255);
  text(z * 10, 10, 20);
}

void central(float x, boolean s) {
  push();
  scale(x);
 
  if (s) fill(c[5]);
  else fill(c[4]);
  
  //strokeWeight((m / 200) / x * 0.5);
  circle(0, 0, m);
  
  for (int r = 0; r < 6; r++) {
    push();
    rotate(radians(r * 60.0));
    if (r % 2 == 0) fill(c[2]);
    else fill(c[3]);
    circle(m, 0, m);
    pop();
  } 
  pop();
}
