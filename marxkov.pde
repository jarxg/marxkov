import rita.*;

RiMarkov markov;
String line = "Communist Manifesto REMIXED";
String[] file = { "marx.txt" };
PFont font;
int x = 20, y = 20;

void setup() {
  size(480, 640);
  background(255);
  fill(0);
  frameRate(1);
  markov = new RiMarkov(3);
  markov.loadFrom(file, this);
  textFont(createFont("fixedsys.ttf", 16));
}

void draw() {
  background(255);
  text(line, x, y, 440, 600);
  if (!markov.ready()) return;
  String[] lines = markov.generateSentences(int(random(1, 10)));
  line = RiTa.join(lines, " ");
  save("output/markov" + int(random(999999999)) + ".png");
}

void mousePressed() { 
  exit();
}
