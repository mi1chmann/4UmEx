 
//color ("red")  polygon([[0,0],[0,100],[100,100],[100,0],[0,0]]);

   

//translate ([22.5,15.3]) color ("gray")   import("U2ExF.DXF");
translate ([-20.3,0.03])
difference()
{
import("../dxf/223 mks mini12864 6mm.dxf");

import("../dxf/CUTFront.dxf");

}

//translate ([0,3]) import("X:/Soft/ultiLib/223 mks mini12864 3mm.dxf");



//rotate([0,180,0]) translate ([-167,194])
//import("X:/Soft/Ultimaker2Extended-master/2214/2214-A.DXF");

//square ([471,252] );

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

TOTAL_H =  LEG_H + PODVAL_H + WALL + INNER_SIZE[2] + WALL + ( LEG_H - WALL );
echo ( TOTAL_H ,TOTAL_H); 
TOTAL_W_black = /*WALL2 +*/ WALL + INNER_SIZE[0] + WALL /*+ WALL2 */;


function RR1 ( x, y, dir, R, STP ) 
= [ for ( a = [3*dir : dir/STP : 4*dir]) [ x + R * sin(a), y + R * cos(a) ] ];

function RR2 ( x, y, dir, R, STP ) 
= [ for ( a = [2*dir : dir/STP : 3*dir]) [ x + R * sin(a), y + R * cos(a) ] ];
    
function RR3 ( x, y, dir, R, STP ) 
= [ for ( a = [180 : dir/STP : 180+dir]) [ x + R * sin(a), y + R * cos(a) ] ];

function RR4 ( x, y, dir, R, STP ) 
= [ for ( a = [-dir : dir/STP : 0]) [ x + R * sin(a), y + R * cos(a) ] ];
    
function ship ( x, y, dir, L, W, R, STP) = 
        concat  
        ( RR1 (x-R, y, dir, R, STP)
        , [[x - R + sign( dir ) * W + R, y + R]] 
        , [[x - R + sign( dir ) * W + R, y + R + L]]
        , [[x - R , y + R + L]]
        , RR2 (x-R, y + 2 * R + L, dir, R, STP)
        );

function area(left, bottom, height) = 
[ 
    [left, bottom]
    , for (a = [height / (WAll_SHIPS + 1)/2 : height / (WAll_SHIPS + 1) : height])
        each ship ( left, bottom + a-SHIP_R/2-SHIP_L/2,-90, SHIP_L, WALL, SHIP_R, R_STP )
    //, [left, bottom + height - SHIP_R]

    //TL
    , each (RR1 ( left + SHIP_R, bottom + height - SHIP_R, 90, SHIP_R, R_STP ))
    
    //, [left  + LEG_L_S, bottom + height]
    , each (RR3 ( left + LEG_L_S, bottom + height + LEG_R, -LEG_A, LEG_R, 20 ))
    
    , each (RR4 ( left + LEG_L_S + 2*LEG_R, bottom + height + LEG_H - LEG_R , LEG_A, LEG_R, 20 ))
    
    , each (RR3 (left + TOTAL_W_black - LEG_L_S - 2*LEG_R - 2*WALL , bottom + height +LEG_H -LEG_R, LEG_A, -LEG_R, 20 ))
    
    , each (RR4 ( left + TOTAL_W_black - LEG_L_S  - 2*WALL, bottom + height + LEG_R , -LEG_A, -LEG_R, 20 ))
    //, [left + TOTAL_W_black  - 2*WALL-SHIP_R, bottom + height]
    , each (RR2(left + TOTAL_W_black  - 2*WALL-SHIP_R, bottom + height-SHIP_R, 90, -SHIP_R, R_STP))
    //, [left + TOTAL_W_black  - 2*WALL, bottom + height]
    , for (a = [height / (WAll_SHIPS + 1)/2 : height / (WAll_SHIPS + 1) : height])
        each ship ( left + TOTAL_W_black  - 2*WALL,SHIP_R+bottom + height - a + (SHIP_R +SHIP_L)/2, -90, -SHIP_L, -WALL, -SHIP_R, R_STP )
    , each (RR1(left + TOTAL_W_black  - 2*WALL -SHIP_R, bottom+SHIP_R, 90, -SHIP_R, R_STP))
    
    //, [left + TOTAL_W_black  - 2*WALL - LEG_L_S,bottom]
    , each (RR3 ( left + TOTAL_W_black  - 2*WALL - LEG_L_S, bottom+LEG_R, LEG_A, LEG_R, 20 ))
    
    , each (RR4 ( left + TOTAL_W_black  - 2*WALL - LEG_L_S -2*LEG_R ,LEG_H -LEG_R + bottom, -LEG_A, LEG_R, 20 ))
    
    , each (RR3 ( left + LEG_L_S + 2*LEG_R, bottom +LEG_H -LEG_R , -LEG_A, -LEG_R, 20 ))
    
    , each (RR4 ( left + LEG_L_S, bottom + LEG_R , LEG_A, -LEG_R, 20 ))
    
   
    
    
    , each (RR2(SHIP_R+WALL, SHIP_R, 90, SHIP_R, R_STP))
    
    
    ]; 
echo("sin(45)" , sin(45) );
echo("cos(45)" , cos(45) );

//polygon (area (0,0,300));
    
function wall (left, bottom, height) = 
   concat ( [[left, bottom]], 
          , [[left, bottom +  height]]);
     
function flat (left, bottom, width) = [[left, bottom], [left +width , bottom ]];

color ("green", 0.3) 
    {
        polygon (area (WALL,0,TOTAL_H - LEG_H));
        echo(  area (WALL,0,TOTAL_H - LEG_H) );
    }




//points = ship(0, 0, -90, 8, 6, SHIP_R, R_STP);
//echo( "points", points );
//polygon(points);

//points = [ for (a = [0 : 1 : 359]) [ 10 * sin(a), 10 * cos(a) ] ] ; polygon(points);

//echo(points);
