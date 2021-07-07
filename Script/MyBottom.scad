include <Params.scad>
include <Table.scad>

/*translate ([6,TOTAL_D_deep - 12 -3*28.5-10 ])*/
 // %square (6+37.125); 
  /*
  translate ([6,6])
  square (28.5); 
  
translate ([6  ,6 + 10 + 28.5])
  square (28.5*2);
  
  translate ([6  ,6 + 2*10 + 3*28.5])
  square (28.5*2);
*/  

THREADED_ROD = 8;
NEMA_17_WHOLES = 31;

function areabottom(left, bottom, width, deep) = 
[ 

//LB
[left,bottom]


, let (SH_L = floor((deep) / TOTAL_H * WAll_SHIPS))
    for (a = [deep / (SH_L)/2 : deep / (SH_L) : deep]) 
          each ship ( left, bottom + a-SHIP_L/2,90, SHIP_L, WALL, SHIP_R )
   //LT 
, [left, bottom + deep]
    
, let (SH_L = floor((width + 2*WALL) / TOTAL_H * WAll_SHIPS))
    for (a = [width / (SH_L)/2 : width / (SH_L) : width])
            each ship ( left+a-SHIP_L/2, bottom + deep, 0, SHIP_L, WALL, SHIP_R, a == (width / (SH_L)/2) ? 0 : width / (SH_L)/2 )
    
    //RT
, [left+width, bottom + deep],
, let (SH_L = floor((deep) / TOTAL_H * WAll_SHIPS))
  for (a = [deep / (SH_L)/2 : deep / (SH_L) : deep])
        each ship ( left + width,bottom + deep - a + (SHIP_L)/2, -90, SHIP_L, WALL, SHIP_R, a == (deep / (SH_L)/2) ? 0 : deep / SH_L/2)
  //RB
, [left+width, bottom],
  , let (SH_L = floor((width + 2*WALL) / TOTAL_H * WAll_SHIPS)) 
    for (a = [width / (SH_L)/2 : width / (SH_L) : width]) 
        each ship ( left +width - a+SHIP_L/2, bottom , -180, SHIP_L, WALL, SHIP_R,a == width / (SH_L)/2? 0 : width / (SH_L)/2 )
    
];

 
function areatop(left, bottom, width, deep) = 
[ 
    
//LB
[left,bottom]

, let ( dDeep = deep-2*LEG_L_S ) 
    let (SH_L = floor((dDeep ) / TOTAL_H * WAll_SHIPS))
      for (a = [dDeep / (SH_L)/2 : dDeep / (SH_L) : dDeep]) 
         each ship ( left, bottom+LEG_L_S + a-SHIP_L/2,90, SHIP_L, WALL, SHIP_R)

   //LT 
, [left, bottom + deep]
, 
      let ( dWidth = width-2*LEG_L_S )
         let (SH_L = floor((dWidth) / TOTAL_H * WAll_SHIPS))
            for (a = [dWidth / (SH_L)/2 : dWidth / (SH_L) : dWidth])
            each ship ( left + LEG_L_S + a - SHIP_L/2, bottom + deep, 0, SHIP_L, WALL, SHIP_R )
    
    //RT
, [left+width, bottom + deep],
, let ( dDeep = deep-2*LEG_L_S ) 
    let (SH_L = floor((dDeep) / TOTAL_H * WAll_SHIPS))
        for (a = [dDeep / (SH_L)/2 : dDeep / (SH_L) : dDeep])
           each ship ( left + width, bottom + deep - LEG_L_S -a + (SHIP_L)/2, -90, SHIP_L, WALL, SHIP_R)
  //RB
, [left+width, bottom],
,
   let ( dWidth = width-2*LEG_L_S )
      let (SH_L = floor((dWidth) / TOTAL_H * WAll_SHIPS)) 
         for (b = [dWidth / (SH_L)/2 : dWidth / (SH_L) : dWidth])
               each ship ( left + width - LEG_L_S - b + SHIP_L/2, bottom , 180, SHIP_L, WALL, SHIP_R )
    
];



//bottom();
module VAL12_HOLES()
{
    for (a =[-T_VAL_RASSOYANIE2/2,T_VAL_RASSOYANIE2/2])
        translate ([a,WALL + TOTAL_D_deep -2*( WALL2 + WALL )-21 ])
           whole (VAL12_R);
}
top();
module top()
{
    difference()
    {
        width = TOTAL_W_black - 2*WALL;
        deep = TOTAL_D_deep -2*( WALL2 + WALL );
        
        polygon (areatop(WALL, WALL, width, deep));

        translate([WALL, WALL])
        translate ([width/2,deep/2])
        for(u = [0:1])
        {
            
            rotate ([0,0,180*u])
            translate ([-width/2,-deep/2])
            {
                SH_L = floor((deep-2*LEG_L_S) / TOTAL_H * WAll_SHIPS);
               
               translate([0, +LEG_L_S])
               {
                    for ( a = [ (deep-2*LEG_L_S) / (SH_L)/2 : (deep-2*LEG_L_S) / (SH_L) : (deep-2*LEG_L_S) ] ) 
                    {
                        if ( a == (deep-2*LEG_L_S) / (SH_L)/2)
                            Vint(0, a - VINT_1_OTSTUP - (SHIP_L)/2, 90);
                        else 
                            Vint(0, a - (deep-2*LEG_L_S) / (SH_L)/2, 90);
                    }
                   Vint(0, (deep-2*LEG_L_S) - (deep-2*LEG_L_S) / SH_L / 2 + (SHIP_L)/2 + VINT_1_OTSTUP , 90);
                }
                
               translate([LEG_L_S,0])
               {
                   SH_L2 = floor((width-2*LEG_L_S) / TOTAL_H * WAll_SHIPS);
                    for ( a = [ (width-2*LEG_L_S) / (SH_L2)/2 : (width-2*LEG_L_S) / (SH_L2) : (width-2*LEG_L_S) ] ) 
                    {
                        if ( a == (width-2*LEG_L_S) / (SH_L2)/2)
                            Vint(a - VINT_1_OTSTUP - (SHIP_L)/2, deep  , 0);
                        else 
                            Vint( a - (width-2*LEG_L_S) / (SH_L2)/2,deep, 0);
                    }
                   Vint((width-2*LEG_L_S) - (width-2*LEG_L_S) / SH_L2 / 2 + (SHIP_L)/2 + VINT_1_OTSTUP, deep  , 0);
                }
            }
        }
        translate ([TOTAL_W_black/2 , 0])
            {
                VAL12_HOLES();
            }
        
        translate ([TOTAL_W_black/2 , TOTAL_D_deep/2 - WALL2])
            offset(15)
                square (1.3*[TOTAL_W_black/2 , TOTAL_D_deep/2 - WALL2],true);
        // holes for podval front ships PFSH
        //PFSH (WALL, LEG_H + PODVAL_H, TOTAL_D_deep - 2*WALL);
        
        //PFSH (LEG_L_F, TOTAL_H - LEG_H, TOTAL_D_deep - 2*LEG_L_F);
    }
}
 // translate ([61.3, WALL + TOTAL_D_deep -2*( WALL2 + WALL )-21 ]) circle(11);
module bottom()
color ("silver", 0.3) 
{
    difference()
    {
        width = TOTAL_W_black - 2*WALL;
        deep = TOTAL_D_deep -2*( WALL2 + WALL );
        
        polygon ( areabottom(WALL, WALL, width, deep) );
        
        translate([WALL, WALL])
         translate ([width/2,deep/2])
        for(u = [0:1])
        {
            
            rotate ([0,0,180*u])
            translate ([-width/2,-deep/2])
            {
                SH_L = floor((deep) / TOTAL_H * WAll_SHIPS);
               
               
               {
                    for ( a = [ deep / (SH_L)/2 : deep / (SH_L) : deep ] ) 
                    {
                        if ( a == deep / (SH_L)/2)
                            Vint(0, a - VINT_1_OTSTUP - (SHIP_L)/2, 90);
                        else 
                            Vint(0, a - deep / (SH_L)/2, 90);
                    }
                   Vint(0, deep - deep / SH_L / 2 + (SHIP_L)/2 + VINT_1_OTSTUP , 90);
                }
                
               
               {
                   SH_L2 = floor((width) / TOTAL_H * WAll_SHIPS);
                    for ( a = [ width / (SH_L2)/2 : width / (SH_L2) : width ] ) 
                    {
                        if ( a == width / (SH_L2)/2)
                            Vint(a - VINT_1_OTSTUP - (SHIP_L)/2, deep  , 0);
                        else 
                            Vint( a - width / (SH_L2)/2,deep, 0);
                    }
                   Vint(width - width / SH_L2 / 2 + (SHIP_L)/2 + VINT_1_OTSTUP, deep  , 0);
                }
            }
        }
        
        
        
        translate ([TOTAL_W_black/2 , 0])
        {
           VAL12_HOLES();
           translate ([0,WALL + TOTAL_D_deep -2*( WALL2 + WALL )-21])//6?
           {
               circle((THREADED_ROD+1)/2);
                for(i = [0:3])
                {
                    rotate([0,0,i*90])
                        translate ([NEMA_17_WHOLES/2,NEMA_17_WHOLES/2])
                            whole(1.5);
                }
            }
        }
        // плюс пазы под гаечки и винтики, и уголки срезать под проводочки
    }
}