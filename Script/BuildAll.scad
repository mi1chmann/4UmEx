use <MyFront.scad>;
color ("green",0.99) translate ([0, + WALL/2 - WALL/2 - INNER_SIZE[1]/2 ] ) rotate ([90,0,0]) linear_extrude (6) front();

include <MyBack.scad>; 
color ("green",.50)
translate ([0, WALL/2 + WALL/2  + INNER_SIZE[1]/2])
rotate ([90,0,0])
    linear_extrude (6) 
        back();
        
use <MyLeft.scad>;
 //translate ([/*+*/-WALL/2  WALL2, 0]) 
 color ("white",0.7)
 translate ([-WALL/2-INNER_SIZE[0]/2-WALL/2, 0, 0 ]) 
 rotate ([90,0,-90]) translate ([0,0,-6])linear_extrude (6) left();
        
use <MyRight.scad>;
color ("yellow", 0.7)
translate ([+WALL/2+INNER_SIZE[0]/2-WALL/2,0 ]) 
 rotate ([90,0,-90]) translate ([0,0,-6]) linear_extrude (6) right();



translate([-30.5,0,0])
translate ([0,0, TOTAL_H/2-LEG_H -ZZ622R - 5 ])
import("stl/UM Extended v4.stl");

use <MyVALS.scad>;
color("gray")
{
    
    translate ([0,INNER_SIZE[1]/2 -VAL_D_POS1/*- 8 - ZZ622R*/, TOTAL_H/2-LEG_H -ZZ622R - 5 ])
        VAL8( VAL1 , 1);

    translate ([0,INNER_SIZE[1]/2 -VAL_D_POS1-VAL_D_POS1D,TOTAL_H/2-LEG_H - ZZ622R - 5 ])
        VAL8( VAL1, 0 );
    

    {
        translate ([INNER_SIZE[0]/2-21,0,TOTAL_H/2-LEG_H -ZZ622R - 23 ])
        rotate ([0,0,90])
        VAL8( VAL2 );
    }
    {
        translate ([-(INNER_SIZE[0]/2-21),0,TOTAL_H/2-LEG_H -ZZ622R - 23 ])
        
        rotate ([0,0,90])
        VAL8( VAL2 );
    }
}

include <Table.scad>

//translate ([0,131 ,-172])

tablemove = 17;
 translate ([0, INNER_SIZE[1]/2 - 21, -172])
            color("red", 0.8)
                import ("stl/Z ROD_2202-A v2.stl");
//-165
translate ([-TABLE_W/2,-TABLE_D/2+tablemove ,135])
{ 
   translate ([0,0 , 25])
    color("gray", 0.6) 
        linear_extrude (4) 
            table ();
    
    
/*???*/    translate ([TABLE_W/2,TABLE_D - T_VAL_RASSOYANIE1,+6.])
    {
         translate ([0,0 ,25])
        color("orange", 0.6) 
        rotate([90,0,0])
            import("stl/NUT_1187-B2P-A v1.stl");
    }
 translate ([0,0 ,25])
    for (a =[-T_VAL_RASSOYANIE2/2,T_VAL_RASSOYANIE2/2])
        {
            translate ([a+TABLE_W/2,TABLE_D - T_VAL_RASSOYANIE1,4])
            {
                color("gray", 0.5)
                    import("stl/LMK12LUU1170-B2P-B v3.stl");
                color("gray",0.8)
                {
                    translate ([0,0,-91-25])
                    rotate([0,90,0])
                        {
                            //echo("VAL12",INNER_SIZE[2] + 2*WALL);
                            VAL12(INNER_SIZE[2] + 2*WALL);
                        }
                }
            }
        }
    
}

use <MyBottom.scad> ;
color("red", 0.99) 
    translate ([-INNER_SIZE[0]/2-WALL,-INNER_SIZE[1]/2-WALL,-TOTAL_H/2 + LEG_H + PODVAL_H  ])
linear_extrude (6)
bottom();


color("red", 0.99) 
    translate ([-INNER_SIZE[0]/2-WALL,-INNER_SIZE[1]/2-WALL,+TOTAL_H/2 - LEG_H ])
linear_extrude (6)
top();

translate([0,147.7,216.00])
rotate([90,0,0])
color("white")
import("stl/COVER ONE 2215-A v1.stl");



// echo("VAL12",INNER_SIZE[2] + 2*WALL);

//use <MK52-24V.scad>; translate ([0 ,0 , 175]) color ("gray",.9) MK52();