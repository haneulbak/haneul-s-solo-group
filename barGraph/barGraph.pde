PFont titleFont, labelFont;
String[] boroughShorts = {"M", "B", "X", "Q"};

int[] gardenNumbers =  {5, 3, 3, 1};
String[] boroughNames = {"Manhattan", "Brooklyn", "Bronx", "Queens"};

void setup() {
  size(600, 200);
  titleFont = createFont("Bauhaus_.ttf", 22);
  labelFont = createFont("SteelTongs.ttf", 36);
  smooth();
  rectMode(CENTER);
}

void draw() {
  background(#333333);
  noStroke();
  int bottomBorder = 40;
  int leftSideBorder = 75;

  for (int i=0; i<boroughShorts.length; i++) {
    int w=120;
    int s=10;
    int[] t = new int[boroughShorts.length];
    t[i] = gardenNumbers[i] * 20;
    int[] x = new int[boroughShorts.length];
    x[i] = int(bottomBorder + (i + .5) * (w + s));
    int[] y = new int[boroughShorts.length];
    y[i] = bottomBorder + t[i] + (i * 5);

    if ((mouseX > (x[i] - w/2)) && (mouseX < (x[i] + w/2)) && 
      (mouseY > (y[i] - t[i]/2)) && (mouseY < (y[i] + w/2))) {
      fill(#FFBA00);
      textFont(labelFont);
      textAlign(CENTER);
      if (mousePressed) {
        text(boroughNames[i] + ": " + gardenNumbers[i], x[i], y[i] - t[i]/2 - 10);
      }
    } else {
      fill(#CCCCCC);
    }
    rect(x[i], y[i], w, t[i]);

    textAlign(CENTER);
    textFont(labelFont);
    fill(#CCCCCC);
    text(boroughShorts[i], x[i], height = bottomBorder/2);
  } 
  stroke(#CCCCCC);
  textFont(labelFont);
  textAlign(RIGHT, CENTER);
  for (int i=0; i<6; i++) {
    int y=height-bottomBorder;
    line(leftSideBorder-5, y, leftSideBorder-8, y);
    text(i, leftSideBorder-15, y);
  }
  textAlign(CENTER);
  textFont(titleFont);
  text("Communal Gardens in New York, 2019", width/2, 30);
}
