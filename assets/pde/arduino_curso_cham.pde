Img img[] = new Img[10];

void setup() {
  size(400, 200);
  background(255);
  imageMode(CENTER);
  noStroke();

  img[0] = new Img(loadImage("../assets/img/fritzing/lcd-screen.png"));
  img[1] = new Img(loadImage("../assets/img/fritzing/servo.png"));
  img[2] = new Img(loadImage("../assets/img/fritzing/potentiometer.png"));
  img[3] = new Img(loadImage("../assets/img/fritzing/piezo_sensor.png"));
  img[4] = new Img(loadImage("../assets/img/fritzing/ldr.png"));
  img[5] = new Img(loadImage("../assets/img/fritzing/7-segment display.png"));
  img[6] = new Img(loadImage("../assets/img/fritzing/arduino_dieci.png"));
  img[7] = new Img(loadImage("../assets/img/fritzing/resistor_220.png"));
  img[8] = new Img(loadImage("../assets/img/fritzing/LED-5mm-red-leg.png"));
  img[9] = new Img(loadImage("../assets/img/fritzing/basic_pbutton.png"));
  fill(0);
  ellipse(0,0,100,100);

  fill(255, 100);
}
void draw() {
  rect(0, 0, width, height);

  for (int i = 0; i < img.length; i++) {
    img[i].update();
  }
}
class Img {
  PImage i;
  PVector vel = new PVector(random(-1.5, 1.5), random(-1.5, 1.5));
  PVector pos;

  Img(PImage _i) {
    i = _i;
    i.resize(i.width, i.height);
    pos = new PVector(random(i.width, width - i.width), random(i.height, height - i.height), random(0, TWO_PI));
  }
  void update() {
    pos.z += random(-.1, .1);
    pos.add(vel);

    pos.x = constrain(pos.x, i.width/2, width - i.width/2);
    pos.y = constrain(pos.y, i.height/2, height - i.height/2);

    if (pos.x <= i.width/2 || pos.x >= width - i.width/2) {
      vel.x = -vel.x;
    }

    if (pos.y <= i.height/2 || pos.y >= height - i.height/2) {
      vel.y = -vel.y;
    }

    pushMatrix();
    translate(pos.x, pos.y);
    rotate(pos.z);
    image(i, 0, 0);
    popMatrix();
  }
}
