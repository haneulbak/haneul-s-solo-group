import processing.video.*;
Movie myMovie;
Capture video;

int numE = 50; 

int eSize[]= new int[numE]; 
int[] ePosX = new int [numE]; 
int[] ePosY = new int [numE]; 

color[] baseColor = new int[numE]; 

Table gardenData;

int manhattanLocCount = 0;
int brooklynLocCount = 0;
int queensLocCount = 0;
int bronxLocCount = 0;

void setup() {
  size(1280, 720);
  gardenData = loadTable("NYC_Greenthumb_Community_Gardens.csv", "header");

  println(gardenData.getRowCount() + " total rows in table"); 

  myMovie = new Movie(this, "ocean w sound_1.mp4");
  video = new Capture(this, 1280, 720);

  for (int i = 0; i<numE; i++) {
    ePosX[i] = int(random(0, width)); 
    ePosY[i] = int(random(0, height)); 

    eSize[i] = int(random(13, 57));

    baseColor[i] = color(int(random(0, 100)), int(random(100, 185)), int(random(185, 255)));
  }
}

void draw() {
  background(0);

  // draw background grid:
  fill(255);
  stroke(255);
 
  for (int i =0; i<numE; i++) {
    fill(baseColor[i]); 
    ellipse(ePosX[i], ePosY[i], eSize[i], eSize[i]);
    noStroke();
  }

  image(myMovie, CENTER, CENTER);

}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}

void mousePressed() {
  for (int i = 0; i<numE; i++) {
    if (dist(ePosX[i], ePosY[i], mouseX, mouseY)<eSize[i]/2) {
      myMovie.play();
    }
  }
}
