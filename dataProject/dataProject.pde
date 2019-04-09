import processing.video.*;
Movie myMovie;
Capture video;

int numE = 50; 

int eSize[]= new int[numE]; 

int[] eSpeedX = new int[numE];
int[] eSpeedY = new int[numE]; 

int[] ePosX = new int [numE]; 
int[] ePosY = new int [numE]; 

color[] baseColor = new int[numE]; 


void setup() {
  size(1280, 720);
  myMovie = new Movie(this, "ocean w sound_1.mp4");
  video = new Capture(this, 1280, 720);

  for (int i = 0; i<numE; i++) {
    ePosX[i] = int(random(0, width)); 
    ePosY[i] = int(random(0, height)); 

    eSpeedX[i] = int(random(-1, 35));
    eSpeedY[i] = int(random(-1, 35));

    eSize[i] = int(random(13, 57));

    baseColor[i] = color(int(random(0, 100)), int(random(100, 185)), int(random(185, 255))); 
    if (eSpeedX[i] == 0) {
      eSpeedX[i] = 1;
    }
    if (eSpeedY[i] == 0) {
      eSpeedY[i] = 1;
    }
  }
}

void draw() {
  background(0);

  //set speed of ellipses 
  for (int i =0; i<numE; i++) {
    ePosX[i] = ePosX[i] + eSpeedX[i]; 
    ePosY[i] = ePosY[i] + eSpeedY[i];
  }

  //setup boundaries for ellipses
  for (int i =0; i<numE; i++) {
    if (ePosX[i] <= 0 || ePosX[i]>= width) {
      eSpeedX[i] = eSpeedX[i]*-1;
    }
    if (ePosY[i] <= 0 || ePosY[i]>= height) {
      eSpeedY[i] = eSpeedY[i]*-1;
    }
  }

  //draw ellipse later 
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
