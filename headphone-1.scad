th = 4;
wd = 20;
rad = 86;
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
st="\u266c";
fontname="Yu Gothic:style=Light";
ex_ang = 86;
module hunit() {
    union () {
    rotate([0,0,ex_ang-90]) translate([0,rad,0]) 
        rotate([0,0,90]) rotate_extrude(angle=90) outline();
    rotate_extrude(angle=ex_ang, $fn=256)
        translate([rad,0,0]) outline();
    }
}

module note() {
color("red")
rotate([0,0,170])
    translate([0,-(rad+th-0.75),0])
    rotate([90,-90,0])
    linear_extrude(1)
    text(st,halign="center",font=fontname);
}

module note2() {
color("red")
rotate([0,0,10])
    translate([0,-(rad+th-0.75),0])
    rotate([90,90,0])
    linear_extrude(1)
    text(st,halign="center",font=fontname);
}


difference() {
    hunit();
    note();
}
difference() {
    mirror([0,1,0]) hunit();
    note2();
}