import java.util.UUID;

PImage image;
PImage brushStroke;

void setup() {
  size(1000, 1000);
  background(10, 15, 17);  

  image = loadImage("images/img7.jpg");
  brushStroke = loadImage("brush_strokes/brush_11.png");
  }

void draw() {
  int strokeSize = 150 - frameCount / 20;
  if (strokeSize < 40) {strokeSize = 40;}
  brushStroke.resize(strokeSize, strokeSize);
  
  int ranX = (int) random(width);
  int ranY = (int) random(height);
  int pixelInd = ranX + ranY * width;
  color c = image.pixels[pixelInd];
  tint(c, 200);

  translate(ranX, ranY);
  rotate(random(2*PI));
  image(brushStroke, -brushStroke.width/2, -brushStroke.height/2);
}

void mousePressed() {
  if (mouseButton == LEFT) {
    String filename = "results/painting_" + UUID.randomUUID().toString() + ".png";
    save(filename);
  }
}
