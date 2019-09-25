
//%square([SHIP_L,WALL],false);

$fn         = 360;
WALL        = 6;
WALL2       = 3;
INNER_SIZE  = [326,337,428];
PODVAL_H    = 90;


VAL1 = INNER_SIZE[0] + 2 * WALL - 1;
VAL2 = INNER_SIZE[1] + 2 * WALL - 1;

VAL_D_POS1 = 37.5;
VAL_D_POS1D = 283.5;


echo("VAL1",VAL1);
echo("VAL2",VAL2);;
LEG_H       = 10;
LEG_L_F     = 32;

LEG_L_S     = LEG_L_F - WALL;
LEG_A       = 45;// no сhangeble
LEG_R       = 10;

NUTS        = 4;

//Corner_R =   3;

TABLE_W = 214;
TABLE_D = 293.5;

ZZ622R = 8;
/* про винты и шипы*/ 
FIRST_VINT_SHIP = 15; // первый доп винт 

SPIP_VINT_R     = 1.5; // m3 винты для сборки корпуса 
SPIP_VINT_L     = 16;  // это от внешней стенки до кончика, потай не потай суть то одна в спеке
SPIP_VINT_NUT_W = 6; // (добавлено 0.5 ?) но 5,5 - ширина квадратной гайки m3
SPIP_VINT_NUT_H = 2; // не проверено  высота квадратной гайки m3


WAll_SHIPS  = 8; // шипов на вертикальном уголке
SHIP_L      = 10; // длина шипа

SHIP_R      = 0.5;  // радиус скругления у основания шипа

// R_STP       = 20;  // не испорльзуется 


module whole (r)
{
    circle (r-0.05, $fn = 360);
}

function Rb(x,y,R,A1,A2,FN = $fn)=
[ 
    let ( p =   let ( bis = (A2+A1)/2 ) 
                let (Roffset = R/sin(abs(bis - A1)) ) 
            [x + Roffset*cos(bis),y + Roffset*sin(bis) ]
        )
let ( start = A1-90*sign (A2 -A1))
let ( end  = A1-90*sign (A2 -A1) - sign (A2 - A1)*(180-2*abs((A2+A1)/2 - A1) ))
    for ( a = [
            start :   sign (end - start) : end]) 
        [ p[0] + R * cos(a), p[1] + R * sin(a) ] ];


TOTAL_H =  LEG_H + PODVAL_H + WALL + INNER_SIZE[2] + WALL + ( LEG_H - WALL );
echo ( "TOTAL_H" , TOTAL_H);

TOTAL_W_black = /*WALL2 +*/ WALL + INNER_SIZE[0] + WALL /*+ WALL2 */;
echo ( "TOTAL_W_black" , TOTAL_W_black);

TOTAL_D_deep = WALL2 + WALL + INNER_SIZE[1] + WALL + WALL2;
echo ( "TOTAL_D_deep" , TOTAL_D_deep);

function ship ( x, y, dir, L, W, R) = 
        concat  
        ( 
          Rb(x, y, R, dir-180, dir-270)
        , [[x - sin(dir) * W , y + cos(dir) * W ]] 
        , [[x - sin(dir) * W + cos(dir) * L, y + sin(dir)*L + cos(dir) * W]]
        , Rb(x + cos(dir)*L, y + sin(dir)*L, R, dir+90, dir)
        );
        
/*
echo ("sin(0)",sin(0));
echo ("cos(0)",cos(0));
echo ("sin(90)",sin(90));
echo ("cos(90)",cos(90));
echo ("sin(180)",sin(180));
echo ("cos(180)",cos(180));
echo ("sin(-90)",sin(-90));
echo ("cos(-90)",cos(-90));
*/

 /*   
function shipold ( x, y, dir, L, W, R, STP) = 
        concat  
        ( RR1 (x-R, y, dir, R, STP)
        , [[x - R + sign( dir ) * W + R, y + R]] 
        , [[x - R + sign( dir ) * W + R, y + R + L]]
        , [[x - R , y + R + L]]
        , RR2 (x-R, y + 2 * R + L, dir, R, STP)
        );*/
    module PFSH(x, y, length ) 
    {
       // fcount = 
        count = floor((length ) / TOTAL_H * WAll_SHIPS);
        if (length == 337)
        {
            echo("count ",count);
            echo("x", x,"y", y, "Length", length);
        }
        
        translate ( [x + length/(count)/2,  y])
        {
            if (length == 337)
            {
                echo("STEP ",length/(count));
            }
            
            for (a = [ 0 : count - 1 ])
            {   
                
                translate ([a*length/(count)-SHIP_L/2,0])
                {
                    echo ( " --0-- ", a*length/(count)-SHIP_L/2 + length/(count)/2 );
                    square([SHIP_L,WALL],false);
                    
                    if ( FIRST_VINT_SHIP !=0 )
                    {
                        if (a == 0)
                        {
                            //translate ([- FIRST_VINT_SHIP,9]) square([FIRST_VINT_SHIP,1]);
                            
                            translate ([- FIRST_VINT_SHIP , WALL/2])
                                circle(SPIP_VINT_R, $fn = 360);
                        }
                        if (a == count - 1)
                        {
                            //translate ([SHIP_L,9]) square([FIRST_VINT_SHIP,1]);
                            
                            translate ([SHIP_L + FIRST_VINT_SHIP,WALL/2])
                                circle(SPIP_VINT_R, $fn = 360);
                        }
                        if (a>0)
                            translate ([-length/(count)/2+SHIP_L/2 ,WALL/2])
                                circle(SPIP_VINT_R, $fn = 360);
                    } else 
                        if (a>0)
                            translate ([-length/(count)/2+SHIP_L/2 ,WALL/2])
                                circle(SPIP_VINT_R, $fn = 360);
                }
            }
        }
    }