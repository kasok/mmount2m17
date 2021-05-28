include <threads.scad>

module sector(h, d, a1, a2) {
    if (a2 - a1 > 180) {
        difference() {
            cylinder(h=h, d=d);
            translate([0,0,-0.5]) sector(h+1, d+1, a2-360, a1); 
        }
    } else {
        difference() {
            cylinder(h=h, d=d);
            rotate([0,0,a1]) translate([-d/2, -d/2, -0.5])
                cube([d, d/2, h+1]);
            rotate([0,0,a2]) translate([-d/2, 0, -0.5])
                cube([d, d/2, h+1]);
        }
    }
}    

union(1){
    difference(){
    cylinder(h=10,r=12);
    //cylinder(h=12,r=15);
    translate([0,0,-0.1]){metric_thread(17,1,50);};
        
    };
    translate([0,0,-4]){
        difference(){
            cylinder(h=4,r=8);
            translate([0,0,-0.1]){cylinder(h=4.2,r=7);};
        };
    }
    translate([0,0,-4]){
        difference(){
            sector(h=2,d=18,a1=1,a2=29);
            translate([0,0,-0.1]){sector(h=2.2,d=16,a1=0,a2=30);};
            //cube([15,25,8],center=true);
        };
    }
     translate([0,0,-4]){
        difference(){
            sector(h=2,d=18,a1=181,a2=209);
            translate([0,0,-0.1]){sector(h=2.2,d=16,a1=180,a2=210);};
            //cube([15,25,8],center=true);
        };
    }
}