#include "Marlin.h"
#ifdef BLINKM

#if (ARDUINO >= 100)
  # include "Arduino.h"
#else
  # include "WProgram.h"
#endif

#include "BlinkM.h"

void SendColors(byte red, byte grn, byte blu)
{
  Wire.begin(); 
  Wire.beginTransmission(0x09);
  Wire.write('o');                    //to disable ongoing script, only needs to be used once
  Wire.write('n');
  Wire.write(red);
  Wire.write(grn);
  Wire.write(blu);
  Wire.endTransmission();
}

#endif //BLINKM

