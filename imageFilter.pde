/**   DM Filter Project Starter Code
/*    v3.5
/*    Original code by: Bradley Beth
/*    Update by: Erik Dillaman, January 2016
**/

// changelog:
// 3.1  added e*Pressed switches and noLoop(); 
// 3.2  added img.resize() to line 132, for students with more advanced filters
// 3.25  possible fix for the double-click bug
// 3.5  double-click bug squashed  [Shout out to Mr. Purdy for the squashing!]

boolean PicLoaded = false;
boolean Grayscale = false;
boolean Effect1 = false;
boolean Effect2 = false;
boolean Effect3 = false;
boolean gPressed = false;
boolean e1Pressed = false;
boolean e2Pressed = false;
boolean e3Pressed = false;
int picWidth = 0;
int picHeight = 0;
PImage img, resetImg;

/***********************************/

void setup() 
{
  noLoop();
  size(800, 480);
  background(185);
  textAlign(LEFT);
  textSize(16);
}

void draw()
{

  background(185);
  fill(0);
  rect(0, 0, 649, 480);
  noStroke();
  int picStart = 0;
  int picEnd = 0;


  /* draw buttons */

  stroke(0);
  fill(0);
  textSize(16);
  text("File Operations", 665, 30);
  line(650, 0, 650, 480);
  noStroke();

  fill(255);
  rect(660, 50, 130, 40, 10);
  fill(55);
  text("Load Picture", 675, 75);

  fill(255);
  rect(660, 100, 130, 40, 10);
  fill(55);
  text("Save Picture", 675, 125);

  stroke(0);
  line(650, 150, 800, 150);
  noStroke();

  stroke(0);
  fill(0);
  textSize(16);
  text("Filter Effects", 675, 180);
  line(650, 0, 650, 480);
  noStroke();

  if (Grayscale)
    fill(#FFFF7D);    //Effect on means a yellow lighted button
  else
    fill(255);
  rect(660, 200, 130, 40, 10);
  fill(55);
  text("Grayscale", 680, 225);

  if (Effect1)
    fill(#FFFF7D);    //Effect on means a yellow lighted button
  else
    fill(255);
  rect(660, 250, 130, 40, 10);
  fill(55);
  text("Deep Fry", 680, 275);

  if (Effect2)
    fill (#FFFF7D);     //Effect on means a yellow lighted button 
  else
    fill(255); 
  rect(660, 300, 130, 40, 10);
  fill(55);
  text("Subtractive", 680, 325);

  if (Effect3)
    fill (#FFFF7D);    //Effect on means a yellow lighted button
  else
    fill(255);   
  rect(660, 350, 130, 40, 10);
  fill(55);
  text("Horizontal Blur", 680, 375);

  fill(185, 0, 203);
  rect(693, 400, 65, 40, 10);
  fill(255);
  text("Reset", 703, 425);

  noStroke();
  textSize(16);

  //The following loads and displays an image file.
  //The image is resized to best fit in a 640x480 frame.
  if (PicLoaded)
  {     
    picWidth = img.width;
    picHeight = img.height;

    if (picWidth > 640)
    {
      picHeight = (int)(picHeight*(640.0/picWidth));
      picWidth = 640;
    }
    if (picHeight > 480)
    {
      picWidth = (int)(picWidth*(480.0/picHeight));
      picHeight = 480;
    }
    img.resize(picWidth, picHeight);
    //  (640-picWidth)/2, (480-picHeight)/2    to CENTER
    picStart = 0;
    picEnd = picStart+img.width*img.height;


    /***** Effects Code *****/
    /* This sample grayscale code may serve as an example */
    if (Grayscale && !gPressed)
    {
      img.loadPixels();
      int i = picStart;
      while (i < picEnd) 
      {
        color c = img.pixels[i];
        float gray = (red(c)+green(c)+blue(c))/3.0;  //average the RGB colors
        img.pixels[i] = color(gray, gray, gray);
        i = i + 1;
      }
      gPressed = true;
    }

    if (Effect1 && !e1Pressed)    //DEEP FRY
    {
      img.loadPixels();
      int i = picStart;    //img.pixels[] INDEX
      
      while(i < picEnd) {    //GETS THE PIXEL COLOR AND PRIORITIZES THEM. MOST PROMINENT IS MULTIPLIED BY 10, SECOND BY 2, THIRD IS LEFT ALONE
        
        if (red(img.pixels[i]) > green(img.pixels[i]) && red(img.pixels[i]) > blue(img.pixels[i]) && green(img.pixels[i]) > blue(img.pixels[i])) {
          img.pixels[i] = color(red(img.pixels[i] * 10), green(img.pixels[i] * 2), blue(img.pixels[i] * 1));
          // RED > GREEN > BLUE  
        }
        
        if (red(img.pixels[i]) > green(img.pixels[i]) && red(img.pixels[i]) > blue(img.pixels[i]) && blue(img.pixels[i]) > green(img.pixels[i])) {
          img.pixels[i] = color(red(img.pixels[i] * 10), green(img.pixels[i] * 1), blue(img.pixels[i] * 2));
          // RED > BLUE > GREEN
        }
        
        if (green(img.pixels[i]) > red(img.pixels[i]) && green(img.pixels[i]) > blue(img.pixels[i]) && blue(img.pixels[i]) > red(img.pixels[i])) {
          img.pixels[i] = color(red(img.pixels[i] * 1), green(img.pixels[i] * 10), blue(img.pixels[i] * 2));
          // GREEN > BLUE > RED
        }
        
        if (green(img.pixels[i]) > red(img.pixels[i]) && green(img.pixels[i]) > blue(img.pixels[i]) && red(img.pixels[i]) > blue(img.pixels[i])) {
          img.pixels[i] = color(red(img.pixels[i] * 2), green(img.pixels[i] * 10), blue(img.pixels[i] * 1));
          // GREEN > RED > BLUE
        }
        
        if (blue(img.pixels[i]) > red(img.pixels[i]) && blue(img.pixels[i]) > green(img.pixels[i]) && red(img.pixels[i]) > green(img.pixels[i])) {
          img.pixels[i] = color(red(img.pixels[i] * 2), green(img.pixels[i] * 1), blue(img.pixels[i] * 10));
          // BLUE > RED > GREEN
        }
        
        if (blue(img.pixels[i]) > red(img.pixels[i]) && blue(img.pixels[i]) > green(img.pixels[i]) && green(img.pixels[i]) > red(img.pixels[i])) {
          img.pixels[i] = color(red(img.pixels[i] * 1), green(img.pixels[i] * 2), blue(img.pixels[i] * 10));
          // BLUE > GREEN > RED
        }    //THERES PROBABLY A MORE EFFICIENT WAY TO DO THIS WITH SORTING ALGORITHMS OR SOMETHING
        
        img.updatePixels();
        i += 1;
      }
      
      e1Pressed = true;
    }

    if (Effect2 && !e2Pressed)
    {
      img.loadPixels();
      
     int location = picStart;
     float red,green,blue;                               //this bit of code starts on the first pixel and cycles through each of the pixels individually and set a red, green, and blue value for each of the pixels and tells the code to stop at the last pixel
     while (location < img.pixels.length - 1)
     {
       red = red (img.pixels[location]);
       green = green( img.pixels[location]);
       blue = blue( img.pixels[location]);
       color newColor = color(red,green,blue);
       if(red<127.5)
       {
       newColor =  color(red += 64,green, blue);      //if the red value of the pixel is less than 127, the code adds 64 to the red value.
       img.pixels[location] = newColor;
       }
       if(red>127.5)
       {
         newColor = color(red -= 64,green,blue);      //if the red value of the pixel is more than 127, the code subtracts 64 to the red value.
         img.pixels[location] = newColor;
       }
       if(green<127.5)
       {
         newColor = color(red, green += 64,blue);      //if the green value of the pixel is less than 127, the code adds 64 to the green value.
         img.pixels[location] = newColor;
       }
       if(green>127.5)
       {
         newColor = color(red, green -= 64,blue);      //if the green value of the pixel is more than 127, the code subtracts 64 to the green value.
         img.pixels[location] = newColor;
       }
       if(blue<127.5)
       {
         newColor = color(red,green,blue += 64);      //if the blue value of the pixel is less than 127, the code adds 64 to the blue value.
         img.pixels[location] = newColor;
       }
       if(blue>127.5)
       {
         newColor = color(red,green,blue -= 64);      //if the blue value of the pixel is more than 127, the code subtracts 64 to the blue value.
         img.pixels[location] = newColor;
       }
         location = location + 1;
     }
      img.updatePixels();
      e1Pressed = true;
    }

    if (Effect3 && !e3Pressed) //ADJUSTABLE HORIZONTAL BLUR. MAKES THE IMAGE LOW RES
    {
      img.loadPixels();
      
      int i = 0;          //INITIALIZE VARIABLES
      int i2 = 0;
      int blocksize = 5;  //ADJUSTABLE. DOESN'T LIKE LARGE ODD NUMBERS OR 24
      
      while (i < picEnd) {
          
        color average = average(img.pixels[i], img.pixels[i + 1], img.pixels[i + 2]);    //AVERAGES THREE PIXELS WITH USER DEFINED FUNCTION average()
          
          while (i2 < blocksize) {    //ITERATES THROUGH THE SPECIFIED AMOUNT OF PIXELS AND SETS THEM TO THE AVERAGE OF THE FIRST THREE
            
          img.pixels[i + i2] = color(average);
          
          i2 += 1;
          }
          
        i2 = 0;    //RESETS THE NESTED WHILE LOOP INDEX
        i += blocksize;    //SKIPS THROUGH PIXELS ALREADY CHANGED
       
      }
      
      img.updatePixels();
      e3Pressed = true;
    }

    img.updatePixels(); 
    redraw();
  }
  
  if (img != null) image(img, (640-picWidth)/2, (480-picHeight)/2, picWidth, picHeight);
  fill(255);
  noStroke();
}

void mouseClicked() {
  redraw();
}

void mousePressed()
{
  //The following define the clickable bounding boxes for any buttons used.
  //Note that these boundaries should match those drawn in the draw() function.

  if (mouseX>660 && mouseX<790 && mouseY>50 && mouseY<90)
  {
    selectInput("Select a file to process:", "infileSelected");
  }

  if (mouseX>660 && mouseX<790 && mouseY>100 && mouseY<140)
  {
    selectOutput("Select a file to write to:", "outfileSelected");
  }

  if (mouseX>660 && mouseX<790 && mouseY>200 && mouseY<240 && PicLoaded)
  {
    Grayscale = true;
    redraw();
  }   

  if (mouseX>660 && mouseX<790 && mouseY>250 && mouseY<290 && PicLoaded)
  {
    Effect1 = true;
    redraw();
  } 

  if (mouseX>660 && mouseX<790 && mouseY>300 && mouseY<340 && PicLoaded)
  {
    Effect2 = true;
    redraw();
  }  

  if (mouseX>660 && mouseX<790 && mouseY>350 && mouseY<390 && PicLoaded)
  {
    Effect3 = true;
    redraw();
  }

  if (mouseX>693 && mouseX<758 && mouseY>400 && mouseY<440 && PicLoaded)
  {
    resetTheImage();
    redraw();
  }


}

void resetTheImage()
{
  Grayscale = false;
  Effect1 = false;
  Effect2 = false;
  Effect3 = false;
  gPressed = false;
  e1Pressed = false;
  e2Pressed = false;
  e3Pressed = false;
  if (PicLoaded) img = resetImg.get();
}

void infileSelected(File selection) 
{
  if (selection == null) 
  {
    println("IMAGE NOT LOADED: Window was closed or the user hit cancel.");
  } else 
  {
    resetTheImage();    
    println("IMAGE LOADED: User selected " + selection.getAbsolutePath());
    img = loadImage(selection.getAbsolutePath());
    resetImg = loadImage(selection.getAbsolutePath());
    PicLoaded = true;
    redraw();
  }
}

void outfileSelected(File selection) 
{
  if (selection == null) 
  {
    println("IMAGE NOT SAVED: Window was closed or the user hit cancel.");
  } else 
  {
    println("IMAGE SAVED: User selected " + selection.getAbsolutePath());
    //    updatePixels();
    //    redraw();
    img.save(selection.getAbsolutePath());
    redraw();
  }
}

color average(color x, color y, color z) {    //AVERAGES THREE SPECIFIED PIXELS
  color avg = color(round((red(x) + red(y) + red(z)) / 3), round((green(x) + green(y) + green(z)) / 3), round(blue(x) + blue(y) + blue(z)) / 3);
  return avg;
}
