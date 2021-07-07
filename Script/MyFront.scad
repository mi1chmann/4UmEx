
//%rotate([0,180,0]) translate ([-169,194]) import("2214-A.DXF");

include <Params.scad>
use <MyBack.scad>
//color ("red")  polygon([[0,0],[0,100],[100,100],[100,0],[0,0]]);

   

//%translate ([-4-326/2,-216.4]) color ("gray",0.5)   import("U2ExF.DXF");

/**/
//translate ([0,3]) import("X:/Soft/ultiLib/223 mks mini12864 3mm.dxf");

//%translate ([TOTAL_W_black/2-4,PODVAL_H + LEG_H]) square ([8,410]);
//square ([471,252] );
/*
$fn         = 36*2;
WALL        = 6;
WALL2       = 3;
INNER_SIZE  = [326,337,427];
PODVAL_H    = 50;
LEG_H       = 10;
LEG_L_F     = 30;

LEG_L_S     = LEG_L_F - WALL;
LEG_A       = 45;
LEG_R       = 8;

WAll_SHIPS  = 8;
NUTS        = 4;
SHIP_L      = 10;
SHIP_R      = 1;
R_STP       = 20;
*/

Corner_IN = 0.5;
/* front ();
 back();*/
module front ()
//color ("green", 0.3) 
{translate ([-TOTAL_W_black/2, -TOTAL_H/2])
    difference ()
    {
        backBlack();
        
         offset (10)
        polygon ( 
       [[WALL + 33+10, 135+10],
        [WALL + 33+10, TOTAL_H -35-10],
        [TOTAL_W_black-(WALL + 33+10), TOTAL_H -35-10],
        [TOTAL_W_black-(WALL + 33+10), 135+10],
        ]
        );
        
    };
};

 //front ();

