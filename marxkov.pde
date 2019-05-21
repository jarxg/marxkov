import rita.*;

RiMarkov markov;
String line = "Communist Manifesto REMIXED";
String file = ("marx.txt");
PFont font;
int x = 20, y = 20;

void setup() {
  size(480, 640);
  background(255);
  fill(0);
  frameRate(1);
  markov = new RiMarkov(2);
  markov.loadFrom(file, this);
  textFont(createFont("gtw.ttf", 14));
}

void draw() {
  background(255);
  text(line, x, y, 440, 600);
  if (!markov.ready()) return;
  String[] lines = markov.generateSentences(int(random(5, 10)));
  line = RiTa.join(lines, " ");
  save("output/marxkov" + int(random(999999999)) + ".png");
}

void mousePressed() { 
  exit();
}
