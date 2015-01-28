public final static int CACHE_SIZE = 999;
Animation timeLapseOne = new Animation("C:/tlOne/GOPR4", 3);
PImage img;                                  

void setup(){
  size(720, 1080);
  frameRate(24); 
  img = loadImage("GOPR4000.JPG");
}


void draw(){
  
  image(img, 0 ,0);
 timeLapseOne.display(0,0);
}

class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 3) + ".JPG";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }
  
  int getWidth() {
    return images[0].width;
  }
}



