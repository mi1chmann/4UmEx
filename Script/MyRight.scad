include <Params.scad>
Corner_R = 0.5;
function arearight(left, bottom, height) = 
[ 

    each ( Rb ( left , bottom + height , Corner_R, -90, 0 ) )
    , each ( Rb ( left + LEG_L_F , bottom + height , LEG_R, 180, 45 ) )
    
    , each ( Rb ( left + LEG_L_F + LEG_H, bottom + height + LEG_H, LEG_R, -90-45, 0 ) )
     
    , each ( Rb ( left + TOTAL_D_deep - LEG_L_F - LEG_H, bottom + height + LEG_H, LEG_R, -180, -45 ) )
 
    , each ( Rb ( left + TOTAL_D_deep - LEG_L_F , bottom + height, LEG_R, 90+45, 0 ) )
 
    , each ( Rb ( left + TOTAL_D_deep , bottom + height , Corner_R, -180, -90 ) )
  

    , each ( Rb ( left + TOTAL_D_deep , bottom, Corner_R, 90, 180 ) )
  
    , each ( Rb ( left + TOTAL_D_deep - LEG_L_F, bottom, LEG_R, 0, 90+45 ) )
  
    , each ( Rb ( left + TOTAL_D_deep - LEG_L_F - LEG_H, bottom + LEG_H, LEG_R, -45, -180 ) )
  
    , each ( Rb ( left + LEG_L_F + LEG_H, bottom + LEG_H, LEG_R, 0, -180+45 ) )
  
    , each ( Rb ( left + LEG_L_F , bottom , LEG_R, 45, 180 ) )

    , each (Rb(left, bottom, Corner_R, 0, 90))

    ];
    
//right();
// translate ([0, 280]) square (270,true);

module ship_vert_holes (center, bottom, height)
{
    //echo ( "height / (WAll_SHIPS )/2" ,height / (WAll_SHIPS )/2 );
    
    for (ab = [0 : WAll_SHIPS-1])
        
    //for (a = [height / (WAll_SHIPS )/2 : height / (WAll_SHIPS ) : height])
    {
        a = height / (WAll_SHIPS )/2  + height / (WAll_SHIPS )*ab;
        if ( FIRST_VINT_SHIP !=0 )
        {
            if (ab == 0)
            {
                translate ( [center, bottom + a - SHIP_L/2 - FIRST_VINT_SHIP])
                circle(SPIP_VINT_R, $fn = 360);
            }
                        
            if (ab == WAll_SHIPS-1)
            {
                translate ( [center, bottom + a + SHIP_L/2 + FIRST_VINT_SHIP])
                circle(SPIP_VINT_R, $fn = 360);
            }
              
          }
          translate ( [center-WALL/2, bottom + a - SHIP_L/2])
          {
            square([WALL,SHIP_L]);
              //echo ("a",a);
             if (a>height / (WAll_SHIPS )/2)
                 translate ([WALL/2, -height / (WAll_SHIPS )/2 + SHIP_L/2])
                            circle(SPIP_VINT_R, $fn = 360);
              
          }
      }
        
}
//right();
//echo (arearight (0,0,TOTAL_H - LEG_H));
module right()

{
    
    color ("green", 0.7) 
    translate ([-TOTAL_D_deep/2, -TOTAL_H/2])
    {
    difference()
    {
        polygon ( arearight (0,0,TOTAL_H - LEG_H) );
        
        
        
    /*{    translate ([10+37.125,90])
        %square (32.125); 
  
    translate ([TOTAL_D_deep - (10 + 37.125 + 32.125),90])
        %square (32.125);
    }*/
        // holes for podval front ships PFSH
        PFSH ((WALL + WALL2), LEG_H + PODVAL_H, INNER_SIZE[1]);
    
        PFSH ((LEG_L_F+ WALL2), TOTAL_H - LEG_H, TOTAL_D_deep - 2*(LEG_L_F+ WALL2));
    
//        echo ("LEG_L_F+ WALL2", LEG_L_F+ WALL2);
//        echo ("TOTAL_D_deep - 2*(LEG_L_F+ WALL2)", TOTAL_D_deep - 2*(LEG_L_F+ WALL2));

        ship_vert_holes (WALL2 + WALL/2, 0, TOTAL_H - LEG_H);
        
        ship_vert_holes (TOTAL_D_deep-(WALL2 + WALL/2), 0, TOTAL_H - LEG_H);
        
        
        // DEEPEST
        translate ([ WALL + WALL2 + VAL_D_POS1 ,TOTAL_H-( LEG_H + 5 + ZZ622R)])
            whole (ZZ622R);
        
        translate ([ WALL + WALL2 + VAL_D_POS1 + VAL_D_POS1D ,TOTAL_H-( LEG_H + 5 + ZZ622R)])
            whole (ZZ622R);
        
    }}

}

//left();