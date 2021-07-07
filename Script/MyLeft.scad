
include <PArams.scad>
use <MyRight.scad>

module left()
color ("green", 0.3) 
{
    difference()
    {
        right();
        // wholes for motor
    }
}
