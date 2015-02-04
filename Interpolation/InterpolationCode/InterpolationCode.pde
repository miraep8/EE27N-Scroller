

  int j = 0;
  int x = 600;
  int y = 320;
  int time = millis();
  int wait = 500;
  int s = 10;
  
  
void setup(){
 
  size ( x, y);  
}

void draw(){
  

  int l = x*y;
  PImage first;
  PImage last;
  
    first = loadImage("ocean.jpeg");
    first.resize(x, y);
    last = loadImage ("forest.jpg"); 
    last.resize(x, y); 

    PImage step = createImage(first.width, first.height, RGB);
        if(j <= s){
        for (int m = 0; m < (first.width*first.height); m++){

        first.loadPixels();
        color a = first.pixels[m];
        last.loadPixels();
        color b = last.pixels[m];
        float ab = blue (a);
        float ag = green (a);
        float ar = red (a);          //These floats get the r,g,b values from each of
        float bb = blue (b);         //images to average.  I would prefer for lerpColor() to work.
        float bg = green (b);
        float br = red (b);
        float bl = ((s-j)*ab + j*bb)/s;
        float g = ((s-j)*ag + j*bg)/s;        //Basically works like a lerp() function.  Averages r,g,b values 
        float r = ((s-j)*ar + j*br)/s;        //with the proper step
        color paint = color(r, g, bl);
        step.loadPixels();
        step.pixels[m] = paint;  //update each of the pixels
        step.updatePixels();
  }  
  image(step,0,0,x,y);
  save("step" + j + ".jpg");
  if(millis()-time >= wait){
    j++;
    time = millis();
 }
        }
        if (j > s){
          j = 0;
        }
}
 
 
    /* first = loadImage("1.JPG");
    first.resize(x, y);
    last = loadImage ("3.JPG"); 
    last.resize(x, y);*/

