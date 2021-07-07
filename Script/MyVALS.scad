
include <Params.scad>

module VAL12 (len)
{
         rotate ([0,90,0])
    cylinder (len,6,6,true);

}

module VAL8 ( len, double = 1 )
{
    echo (len);

 
    if (VAL1 == len)
        //rotate (0,45,90)
    {
        translate ([+len/2 - 10 -5.25 -1,0,0])
            rotate ([0,-90,0])
                import("stl/Pulley_1166-C v1.stl");
        
        if ( double == 1 )
        translate ([-len/2 + 23,0,0])
            rotate ([0,-90,0])
                import("stl/dPulley_1167-D v1.stl");
        else 
            translate ([-len/2 + 10+5.25+1,0,0])
                rotate ([0,90,0])
                    import("stl/Pulley_1166-C v1.stl");
    }
    else 
   {
        translate ([+len/2 - 10 -5.25 -1 -7,0,0])
            rotate ([0,90,0])
                import("stl/Pulley_1166-C v1.stl");
       
       translate ([+len/2 - 10 -5.25 -1 -7 -10,0,0])
            rotate ([0,-90,0])
                import("stl/Pulley_1166-C v1.stl");
       
       
        translate ([-len/2 + 5 +5.25 ,0,0])
            rotate ([0,+90,0])
                import("stl/Pulley_1166-C v1.stl");
        
    }
     translate ([-len/2 + 6.5,0,0])
            rotate ([0,-90,0])
                import("stl/Ball Bearing F688-1220-A v1.stl");
        
        translate ([len/2 - 6.5,0,0])
            rotate ([0,90,0])
                import("stl/Ball Bearing F688-1220-A v1.stl");
    
    rotate ([0,90,0])
    cylinder (len,4,4,true);
    
}

module VAL6 (len)
{
        rotate ([0,90,0])
    cylinder (len,3,3,true);

    
}
//VAL8(337);