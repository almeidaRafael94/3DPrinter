//-- P3Steel / Prusa i3 Z-axis endstop holder
//-- by AndrewBCN - Barcelona, Spain - December 2014
//-- GPLV3
//-- from an original design by Stefaan Ponnet
//-- Thingiverse #64254

//-- designed to hold a makerbot-style mechanical endstop

//-- requires 2 x M3 8mm screws and 2 x M3 nyloc nuts

//-- designed specifically to be used with my improved
//-- P3Steel X-axis Motor End with adjustable Z endstop
//-- screw

//-- Parameters

tol=0.1;
$fn=40;
width = 17;
length=22;

switch_plate_length=2;
switch_plate_height=3;
overhang=8.5;
m3_diameter=3.4;
holder_hole_spacing=18.8;

//-- Modules

module makerbot_plate(mp_height=12.5) {
  difference() {
    union() {
      cube([width+overhang,3,mp_height]);
      // the two M3 holes below are very close to the edges of the cube so let's reinforce the edges
      translate([3.3,3,mp_height-3]) rotate([90, 0, 0]) cylinder(h=3,r=4.5, $fn = 10);
      translate([3.3+holder_hole_spacing,3,mp_height-3]) rotate([90, 0, 0]) cylinder(h=3,r=4.5, $fn = 10);
    }
    // two M3 holes
    translate([3.3,5,mp_height-3]) rotate([90, 0, 0]) cylinder(h =20, r = m3_diameter/2, $fn = 10);
    translate([3.3+holder_hole_spacing,5,mp_height-3]) rotate([90, 0, 0]) cylinder(h =20, r = m3_diameter/2, $fn = 10);
    // trim a little bit
    translate([-3,-5,-3]) rotate([0, -15, 0]) cube ([5,10,20]);
  }
}

module endstop_holder(ziptie_w=1.2,ziptie_h=4,height=8) {
  rotate([0,0,90])
  difference() {
    union() {
      translate([-width/2,-length/2,-height]) cube(size=[width,length,height]);
      // Surface that contacts the Makerbot mechanical endstop
      translate([-width/2-overhang,-length/2,-height]) makerbot_plate(height+5.5);
      // cone
      translate([0,0,-height]) cylinder(r=6.5+tol,h=height+switch_plate_height);
      // reinforce the part a little bit
      //translate([-width/2-tol,6,-height/2]) rotate([0,90,0]) rotate([0,0,30]) cylinder($fn=6,r=3.25,h=2);
    }   
    translate([0,0,-height-tol]) cylinder(r=4+tol,h=height+switch_plate_height+2*tol);
    
    translate([-width/2-overhang+6,-length/2-2.4,-5.5]) cube([13.3,4,6]);
    
    // klem gat
    translate([(-8-tol)/2,2,-height-tol]) cube(size=[8+tol,length/2+tol,height+2*tol]);

    // weggommen halve cirkel geleidingsbus
    translate([(-7-tol),2,0]) cube(size=[14+2*tol,12/2+tol,switch_plate_height+2*tol]);
    translate([-10,6,1]) rotate([-30,0,0]) cube(size=[20,10,switch_plate_height]);
    
    // get some space for nut
    translate([1,-8.5,-1]) cube(size=[10,3,10]);

    // schroefgat
    translate([-width/2-tol,6,-height/2]) rotate([0,90,0]) cylinder(r=1.5+tol*2,h=width+2*tol);
    translate([-width/2-tol,6,-height/2]) rotate([0,90,0]) rotate([0,0,30]) cylinder($fn=6,r=3.25,h=1.3);
  }
}

//-- Print the part
endstop_holder(1.5,5+tol*2,9);
