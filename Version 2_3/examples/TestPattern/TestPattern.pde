/*
  gLCD Library Example 1:
  
  This example shows you how to create an instance of the display,
  connect it to the correct pins, and then display the built in
  Test Pattern.
  
  gLCD should work for all Nokia Clone 128x128 screens which have the
  Epson controller chip.
*/

#include <gLCD.h>

//You can use these variables to set the pin numbers
const char RST = 8;
const char CS = 9;
const char Clk = 13;
const char Dat = 11;

/*Create an instance of the display. Lets call it 'graphic'.
  There are four variables,
  which define which pins the LCD is connected too. 
  these are:
    Reset, Chip Select, Clock, Data 
*/
gLCD graphic(RST,CS,Clk,Dat);


void setup() {  
 /*Display needs to be initialised. You only need to do this once,
   You may have to press the Arduino reset button after uploading
   your code as the screen may fail to startup otherwise
   
   The first two variables in the Init call specify where on the screen
   (0,0) is. On some screens the first one or two rows/cols of
   pixels aren't visible, so Init(X,Y,,) allows all X and Y co-ords
   to be shifted slightly. (0,2) works well for both my screens.
   
   The third variable specifies whether the colours are inverted.
   If the White appears as Black on your screen, set this to a 1
   Else leave it as a zero
   
   If you have a Phillips screen, you need to provide a fourth and fifth variable
   i.e. Init(0,0,0,1,xRevese); 
			The fourth variable is 1. This tells the library to use the phillips startup sequence.

			The fifth byte is called xReverse. This controls how the phillips display will behave,
			and requires some trial and error to get right.
			
					   First, try setting it to 0 and observe which way the screen prints
					   the image onto the screen.
					   -If it builds up the image from the LEFT(connector end is the top):
						0 is correct.
					   -If it builds up from the RIGTH:
						set it to 1 (it should now scan from the LEFT)
					   -If it builds up from the BOTTOM:
						set it to 2 (it should now scan from the LEFT, else try 3)
					   -If it builds up from the TOP:
						set it to 3 (it should now scan from the LEFT, else try 2)
   
   If you have an Epson screen dont use these last two variables;
   i.e. Init(0,0,0);
 */
   
 //For an Epson Screen:
 graphic.Init(0,2,0);
 
 //For a Phillips Screen, use one of this:
 //graphic.Init(0,2,0,1,0); //Normal X direction
 //or this:
 //graphic.Init(0,2,0,1,1); //Revesed X direction.
 //or this:
 //graphic.Init(0,2,0,1,2); //Normal X, Revesed Y direction.
 //or this:
 //graphic.Init(0,2,0,1,3); //Revesed X, Revesed Y direction.
 
 
 /*If you can't see the colours properly, then uncomment the 
   graphic.Contrast() function. 
   If the Screen is too dark, or you cant see anything send a value >0x2B (>0x30 for Phillips). If you cant see all
   the different colours distinctly on the test pattern, send a value <0x2B (<0x30 for Phillips). The default values
   should work for many screens, so you may not have to use this at all.
   
   Range for phillips: -0x3F to 0x3F
   Range for EPSON:		0x00 to 0x3F
 */

 //graphic.Contrast(0x2B);
 
}
void loop() {
  //Print out the test pattern.
  graphic.testPattern();
  while(1); //Finished
}
