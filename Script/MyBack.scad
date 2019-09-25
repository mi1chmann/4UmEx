include <Params.scad>

Corner_IN = 0.5;

        
function areaback(left, bottom, height) = 
[ 

    [left, bottom]
    , for (a = [height / (WAll_SHIPS)/2 : height / (WAll_SHIPS) : height])
        each ship ( left, bottom + a-SHIP_L/2,90, SHIP_L, WALL, SHIP_R)
    
    //TL

    , each ( Rb ( left , bottom + height , Corner_IN, -90, 0 ) )
    //- legs
    
    , each (Rb ( left + LEG_L_S, bottom + height, LEG_R, 180,45))
    
    , each (Rb ( left + LEG_L_S+LEG_H, bottom + height +LEG_H, LEG_R, -90-45, 0))
    
    
    , each (Rb ( left + TOTAL_W_black - LEG_L_S - 2*WALL - LEG_H, bottom + height +LEG_H, LEG_R, -180, -45))
    
     , each (Rb ( left + TOTAL_W_black - LEG_L_S - 2*WALL, bottom + height , LEG_R, 180-45, 0))

    , each (Rb ( left + TOTAL_W_black - 2*WALL, bottom + height  , Corner_IN, -180, -90))
    , for (a = [height / (WAll_SHIPS)/2 : height / (WAll_SHIPS) : height])
        each ship ( left + TOTAL_W_black  - 2*WALL,bottom + height - a + (SHIP_L)/2, -90, SHIP_L, WALL, -SHIP_R)
    
    //RB
    , each (Rb ( left + TOTAL_W_black - 2*WALL, bottom  , Corner_IN, 90, 180))

    , each (Rb ( left + TOTAL_W_black - 2*WALL- LEG_L_S, bottom  , LEG_R, 0, 180-45))

    
    , each (Rb ( left + TOTAL_W_black - 2*WALL- LEG_L_S - LEG_H, bottom +LEG_H , LEG_R, -45, -180))
    
    , each (Rb ( left + LEG_L_S + LEG_H, bottom +LEG_H , LEG_R, 0, -180+ 45))
    
    , each (Rb ( left + LEG_L_S, bottom , LEG_R, 45, 180 ))

    , each (Rb ( left , bottom , Corner_IN, 0, 90 ))
];
 

// 13
// 23
    // необходимо параметризовать и привязать к расстоянию между валами и центру рабочей области
    
 //   backBlack ();
module backBlack ()
color ("green", 0.3) 
{
//    translate ([0,-34]) square(43);
    echo (areaback (WALL,0,TOTAL_H - LEG_H));
    difference()
    {
        polygon ( areaback (WALL,0,TOTAL_H - LEG_H) );
        
// ship wholes        
        PFSH (WALL, LEG_H + PODVAL_H, TOTAL_W_black - 2*WALL);
        PFSH (LEG_L_F, TOTAL_H - LEG_H, TOTAL_W_black - 2*LEG_L_F);
        
//VAL wholes        
        translate ([ TOTAL_W_black / 2 - VAL_D_POS1D/2 ,TOTAL_H-LEG_H -ZZ622R - 23])
            whole (ZZ622R);
        
        translate ([ TOTAL_W_black / 2 + VAL_D_POS1D/2 ,TOTAL_H-LEG_H -ZZ622R - 23])
            whole (ZZ622R);
        
        //echo ( TOTAL_W_black -(WALL+ZZ622R + 13) - (WALL+ZZ622R + 13));
    }
};

module back ()
{
    translate ([-TOTAL_W_black/2, -TOTAL_H/2])
    backBlack();
}
 //backBlack ();


