th = 4;
wd = 20;
rad = 90;
$fn=64;

module outline() {
intersection() {
    translate([0,-wd/2,0]) square([th,wd]);
    union() {
    translate([0,-(wd/2-th),0]) circle(th);
    translate([0,wd/2 - th,0]) circle(th);
    translate([0,-wd/2 + th,0]) square([th, wd-2*th]);
    }
}
}

//rotate_extrude(angle=90) translate([5,0,0]) circle(5);
//outline();
ex_ang = 86;
module hunit() {
    union () {
    rotate([0,0,ex_ang-90]) translate([0,rad,0]) 
        rotate([0,0,90]) rotate_extrude(angle=90) outline();
    rotate_extrude(angle=ex_ang, $fn=256)
        translate([rad,0,0]) outline();
    }
}


fontname="Yu Gothic:style=Light";
module note(st, flip, rot) {
    ang = (flip>0) ? -90 : 90;
color("red")
rotate([0,0,rot])
    translate([0,-(rad+th-0.75),0])
    rotate([90,ang,0])
    linear_extrude(1)
    text(st,halign="center",font=fontname);
}

difference() {
    hunit();
    note("\u266c",1,170);
}
difference() {
    mirror([0,1,0]) hunit();
    note("\u266a",0,10);
}