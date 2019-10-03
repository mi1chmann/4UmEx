// mks base 12864 mini.
// SomeParems


DW1 = 54;
DH1 = 50;
D_A = 0.5;

R_W_OFF = DW1/2+23.9-2.7;
UD_W_OFF = DH1/2+(52.2 - 1.1 - 50);
R_R = 3.2/2;

L_W_OFF = R_W_OFF - 86;

$fn = 360;
MB12864_6();

module MB12864_6()
{
     
    translate ([-(DW1+D_A)/2,-(DH1+D_A)/2])
        square ([DW1+D_A,DH1+D_A]);
    echo(DH1+D_A);
   echo(DW1+D_A);
    
     translate ([R_W_OFF,UD_W_OFF])
            circle (R_R);
     translate ([R_W_OFF,-UD_W_OFF])
            circle (R_R);
    
         translate ([L_W_OFF,UD_W_OFF])
            circle (R_R);
     translate ([L_W_OFF,-UD_W_OFF])
            circle (R_R);
    translate ([R_W_OFF + 2.7 - 12.95 , UD_W_OFF - 8.55 -10.8 - (13.5 + 0.5)/2])
        square ([12.5+0.5,13.5 + 0.5],true);
    
    translate ([R_W_OFF + 2.7 - 12.95 , UD_W_OFF - 8.55 -10.8 - (13.5 + 0.5)/2 -6 - 6.47])
        square ([6+0.5,6 + 0.5],true);
    
}
