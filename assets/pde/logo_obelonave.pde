// Logo do blogue http://obelonave.tumblr.com/

void setup() {
  size(400, 400);
  background(255);
  noStroke();
  rectMode(CENTER);
  frameRate(24);
}

void draw() {

  translate(width/2, height/2);

  fill(255, 3);
  rect(0, 0, width, height);

  rotate(random(255));
  
  fill(random(255), random(255), random(255), 180);
  rect(0, 20, 100, 10);

  rotate(PI);
  rect(0, 100, 200, 30);
}


