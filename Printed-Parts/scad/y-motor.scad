// PRUSA iteration3
// Y motor mount
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

//include <configuration.scad>

module y_motor_base() {
  union() {
    // Motor holding part
    translate(v = [29,-21+50,0]) {
      difference() {
        union() {
          translate(v = [-21+4.5,0,5]) cube(size = [9,31,10], center=true);
          translate(v = [-15.5,-15.5,0]) cylinder(h = 10, r=5.5, $fn=50);
          translate(v = [-15.5,+15.5,0]) cylinder(h = 10, r=5.5, $fn=50);
          translate([-21,7,0]) rotate([0,0,45]) cube([2, 2, 10]);

          //end stop
          /* translate(v = [-10.5,+15.5,0]) cylinder(h = 12, r=5.5, $fn=50); */
          translate([-12,0,0]) cube([7, 15, 10]);
          translate([-16,15,0]) cube([11, 4.1, 10]); //top of endstop mount //here
          translate([-21+6,8,0]) cube([12-2, 5, 29]);
          translate([-21,8-5,0]) cube([8, 10, 29]);
          translate([-21+9.5-2,7,0]) rotate([0,0,45]) cube([2, 2, 29]);
          // Joins motor holder and rod plate
          translate(v = [-29,-21,0]) cube(size = [14,30,10]);
        }
          //selective infill
          translate([-14.5,5,0.3]) cube([0.1,5.5,27]);
          translate([-16.5,5,0.3]) cube([0.1,5.5,27]);
          translate([-18.5,5,0.3]) cube([0.1,5.5,25]);
          translate([-10,9,1]) cube([0.1,3,26.3]);
          translate([-8,9,6]) cube([0.1,3,21.3]);
      }
    }
  }
  // Front holding part
  hull() {
    translate(v = [0,8,0]) cylinder(h = 10, r=9, $fn=80);
    translate(v = [0,29,0]) cylinder(h = 10, r=9, $fn=80);
  }
}

module y_motor_holes() {
  translate(v = [29,-21+50,0]) {
    // Screw head holes
    translate(v = [-15.5,-15.5,-1]) cylinder(h = 10, r=1.8, $fn=20);
    translate(v = [-15.5,+15.5,-1]) cylinder(h = 10, r=1.8, $fn=20);
    // Screw holes
    translate(v = [-15.5,-15.5,7]) cylinder(h = 7, r=3.5, $fn=30);
    translate(v = [-15.5,+15.5,7]) cylinder(h = 25, r=3.5, $fn=30);
  }

  translate(v = [0,8,-1]) cylinder(h = 12, r=5.2, $fn=50);
  translate(v = [0,29,-1]) cylinder(h = 12, r=5.2, $fn=50);

  //endstop
  translate([25,29,0])  cylinder(h = 29, r=8, $fn=20);

  /* M3 core diameter~=2.4mm */
  /* hole distance from front edge=3.1 */
  fed = 2.5;
  side_dist = -3.3 + 10;
  height_difference = 5.9;
  translate([24-fed,45+height_difference,side_dist]) rotate([90,0,0]) cylinder(h = 10, r=1.2, $fn=20);
  translate([24-fed,42.2+height_difference,side_dist]) rotate([90,0,0]) cylinder(h = 2, r1=1.7, r2=1.2, $fn=20);

  /* center distance endstop holes=19mm */
  cdist = 19;
  translate([24-fed,45,side_dist+cdist]) rotate([90,0,0]) cylinder(h = 10, r=1.2, $fn=20);
  translate([24-fed,42.2,side_dist+cdist]) rotate([90,0,0]) cylinder(h = 2, r1=1.7, r2=1.2, $fn=20);
  /* side distance for first hole = 3.7 */

  // endstop corner cutout
  translate([-10,30,28]) rotate([0,45,0]) cube([15, 19, 20]);
  translate([-1,41,10])  cube([15, 5, 19]);
  translate([27,33,0]) rotate([0,0,45]) cube([5, 5, 28]);
  translate([7,28,10.01]) rotate([0,0,45]) cube([5, 5, 28]);

  translate([22,32,0]) rotate([0,30,0]) cube([8, 20, 18]);
  translate([24.5-2,32,18.5]) rotate([0,45,0]) cube([3, 20, 3]);

  translate([23,32,29]) rotate([0,45,0]) cube([5, 20, 5]);

  // cut off top of end-stop mount
  translate([0,48.1,0]) cube([100,100,100]);
}

// Final part
module y_motor() {
  difference() {
    y_motor_base();
    y_motor_holes();
  }
}

y_motor();

