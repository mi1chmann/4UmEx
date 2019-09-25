

include <Params.scad>
$fn = 360;
//color ("white")translate ([0,-10]) import("table.DXF");

BORDER_R = 3;

T_HOLE_R1 = 1.5;
T_HOLE_C_OFF = 1;
T_HOLE_R2 = 1.25;

VAL12_R = 6;
VAL8_R = 4;
VAL6_R = 3;

SIZE = 214;
T_VAL_R = VAL12_R+1;
T_LMK12LUU_HOLE_OFF = 16;
T_VAL_RASSOYANIE1 = 16;

T_VAL_RASSOYANIE2 = 160;
VAL_HOLE_R = 1.75;

VAL_B_R = 5;
T_VAL_B_RASSOYANIE = 8;

T_VAL_NULT_FIX = 1.65;


TR_1_OFF    = 81;
TR_23_OFF   = 39;

AA = 140; //(degrees) and R1 = 2, R2 = 5

// контр
// сужение
SUJENIE = 241;
SUJENIE2 = 7;

SUJENIE3 = 11;
COVER_HOLSER_SIZE = 5;

module table ()
{
   
    difference()
    {
        polygon ([
            [0,0]
            , each Rb (0, SUJENIE, 5, -90, 45 )
            , each Rb (SUJENIE2, SUJENIE + SUJENIE2, 5, 180+45, 90  )
, each Rb (SUJENIE2,   SUJENIE + SUJENIE2 + SUJENIE3,      0.33,  -90,    0)
, each Rb (SUJENIE2+3, SUJENIE + SUJENIE2 + SUJENIE3,      0.33, 180,   90 )
, each Rb (SUJENIE2+3, SUJENIE + SUJENIE2 + SUJENIE3 + 3,  0.33,  -90, -180)
, each Rb (SUJENIE2,   SUJENIE + SUJENIE2 + SUJENIE3 + 3,  0.33,    0,   90)
, each Rb (SUJENIE2,                TABLE_D ,  5,    -90,       0   )

, each Rb (TABLE_W - SUJENIE2,      TABLE_D ,  5,    -180,      -90 )
, each Rb (TABLE_W - SUJENIE2,   SUJENIE + SUJENIE2 + SUJENIE3 + 3,  0.33,    90,   180)
, each Rb (TABLE_W-(SUJENIE2+3), SUJENIE + SUJENIE2 + SUJENIE3 + 3,  0.33,  0, -90)
, each Rb (TABLE_W-(SUJENIE2+3), SUJENIE + SUJENIE2 + SUJENIE3,      0.33, 90,   0 )
, each Rb (TABLE_W - SUJENIE2,   SUJENIE + SUJENIE2 + SUJENIE3,      0.33,  -180,    -90)
, each Rb (TABLE_W - SUJENIE2,   SUJENIE + SUJENIE2, 5, 90, -45  )
, each Rb (TABLE_W, SUJENIE, 5, 90+45, 270 )
, each Rb (TABLE_W, 0, 2, 90, 180 )
, each Rb (0, 0, 2,  0,90 )

        ]);
        // bedholder
        translate ([T_HOLE_C_OFF + T_HOLE_R1,T_HOLE_C_OFF + T_HOLE_R1])
            circle (T_HOLE_R1);
        translate ([TABLE_W-(T_HOLE_R1+T_HOLE_C_OFF),T_HOLE_R1+T_HOLE_C_OFF])
            circle (T_HOLE_R1);

        translate ([T_HOLE_C_OFF + T_HOLE_R1,SIZE - (T_HOLE_C_OFF+T_HOLE_R1)])
            circle (T_HOLE_R1);
        translate ([TABLE_W-(T_HOLE_R1+T_HOLE_C_OFF),SIZE - (T_HOLE_C_OFF+T_HOLE_R1)])
            circle (T_HOLE_R1);

        translate ([TABLE_W/2,SIZE - (T_HOLE_C_OFF+T_HOLE_R1)])
            circle (T_HOLE_R1);

        //translate () #circle (T_HOLE_R1);
        //VALS
       
        for (a =[-T_VAL_RASSOYANIE2/2,T_VAL_RASSOYANIE2/2])
        {
            translate ([a+TABLE_W/2,TABLE_D - T_VAL_RASSOYANIE1])
               circle (T_VAL_R);
          
            translate ([a+TABLE_W/2,TABLE_D - T_VAL_RASSOYANIE1])
                for (i = [45 : 90 : 360])
                    rotate ([0,0,i])
                        translate([T_LMK12LUU_HOLE_OFF,0])
           
                            circle (VAL_HOLE_R);
        }
       {//center val
            translate ([TABLE_W/2,TABLE_D - T_VAL_RASSOYANIE1])
           {
                circle (VAL_B_R);
                for (i = [45 : 90 : 360])
                rotate ([0,0,i])
                    translate([T_VAL_B_RASSOYANIE,0])
                        circle (T_VAL_NULT_FIX);
           }
           
       }
       // inner triangles
       translate ([SIZE/2,SIZE/2])
       {
           for (i = [90 : 90 : 360])
                rotate ([0,0,i])
                    translate([SIZE/2 - TR_1_OFF,0])
           offset(BORDER_R)
           polygon ([
           [0,0],
           [(TR_1_OFF - TR_23_OFF) ,(TR_1_OFF - TR_23_OFF)],
           [(TR_1_OFF - TR_23_OFF) ,-(TR_1_OFF - TR_23_OFF) ],
           ]);
       }
   }
}
