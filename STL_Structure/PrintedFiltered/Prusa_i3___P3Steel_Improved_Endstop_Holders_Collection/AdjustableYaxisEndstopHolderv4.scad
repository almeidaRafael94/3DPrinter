//-- P3Steel Y axis adjustable endstop holder with selectable endstop carrier
//-- This is a remix of the Y axis adjustable endstop holder for
//-- the Prusa i3 vanilla, by Matt (www.greymatterdroppings.com)

//-- Remix by AndrewBCN - Barcelona, November 2014

//-- to be attached to the back plate of the P3Steel
//-- using a single M3 x 12mm bolt + nyloc nut.

//-- requires 6 x M3 x 10mm bolts + nyloc nuts for assembly.

//-- Note about the code: for some reason the original source code
//-- had all the parts "hanging in thin air" and the Y and Z axis were shifted.
//-- This "ugly" obviously needs fixing but I was in a hurry to print this part
//-- and get a usable endstop for my P3Steel.

$fn = 32;
base_thickness = 3;
hole_distance = 9.2; // check position and adjust if needed

module p3steel_horiz_mount() {
  // inverted J shape base screwed to back plate of P3Steel
  difference() {
    translate([24,4,-19.5]) cube([base_thickness,21,21]);
    translate([20,14.5,-1.5-hole_distance]) rotate([0,90,0]) cylinder(h=10,r=3.4/2); // hole for M3 bolt
  }
  translate([27,4,-1.5]) cube([base_thickness+0.5,21,3]);
  // 3.2 = P3Steel frame thickness + tolerance
  translate([27+3.2,4,-5.5]) cube([base_thickness,21,7]);

  //brace
  difference() {
    translate([-24,4,-18.5]) cube([50,5,13]);
    translate([-53.5,3.5,-16]) rotate([0,15,0]) cube([80,10,20]);
  }
	      
  //Horizontal frame mount
  translate([-8,12,-2.5]) rotate ([90,0,0]) difference() {
    translate([-15,-4,0]) cube([50, 8, 8]);

    translate([-7,0,-2]) cylinder(h=10,r=1.75);
    translate([-7,-1.75,-2]) cube([30,3.5,10]);
    translate([23,0,-2]) cylinder(h=10,r=1.75);
  }
}

module vert_mount() {
  //Vertical Frame Mount
  translate([-10,12,20]) rotate([90,0,0]) difference() {
    translate([-5,-4,0]) cube([42, 8, 8]);
    
    translate([0,0,-2]) cylinder(h=10,r=1.75);
    translate([0,-1.75,-2]) cube([30,3.5,10]);
    translate([30,0,-2]) cylinder(h=10,r=1.75);
  }

  translate([0,0,2]) difference() {
    translate([27,4,27]) rotate([0,90,0]) cube([18, 4, 8]);

    translate([31,12,13]) rotate([90,0,0]) cylinder(h=10,r=1.75);
    translate([31,12,23]) rotate([90,0,0]) cylinder(h=10,r=1.75);
  }
	      
  translate([29.25,10,23]) rotate([90,90,0]) cube([6, 3.5, 5]);
  translate([24.5,4,23]) rotate([0,90,0]) cube([6, 3.5, 5]);
}

module makerbot_carrier() {
  // MakerBot mechanical endstop carrier piece
  difference() {
    union() {
      hull() {
	translate ([5,4,40+16.6+3.75+2]) rotate([-90,0,0]) cylinder(r=4.25,h=4);
	translate ([15,4,40+16.6+3.75+2]) rotate([-90,0,0]) cylinder(r=4.25,h=4);
      }
      translate ([-8.3,4,40]) cube ([28.6,4,16.6]);
      translate ([5,4,56.6]) cube ([10,4,2.1]);
      translate ([10,1,40+16.6+3.75+2]) rotate([-90,0,0]) cylinder(r=3.3/2,h=5);      
    }
    union() {
      // holes
      translate ([5,3,40+16.6+3.75+2]) rotate([-90,0,0]) cylinder(r=3.4/2,h=6);
      translate ([15,3,40+16.6+3.75+2]) rotate([-90,0,0]) cylinder(r=3.4/2,h=6);
      // makerbot endstop holes
      translate ([16.8,3,40+3.4]) rotate([-90,0,0]) cylinder(r=3.4/2,h=6);
      translate ([-2.2,3,40+3.4]) rotate([-90,0,0]) cylinder(r=3.4/2,h=6);
      // makerbot endstop carvings
      translate ([0,3,42+3.4+1.4]) cube([14,7,5]);
      translate ([-13,3,42+1.4]) cube([8,7,10]);
    }
  }
}

// Print it

//p3steel_horiz_mount();
//vert_mount();
makerbot_carrier();
