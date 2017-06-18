base_thickness=4.5;
/* x-end.scad line 20 */
base_diameter=25;
/* x-end.scad line 20 */
shaft_thickness=8;
/* x-end.scad line 65 */
shaft_diameter=14-1;
nut_thickness=2;
nut_key_width=7.9-.1;
bore_diameter=4+3.5;
/* x-end.scad line 69-70 */
mounting_holes_diameter=3.6;
/* x-end.scad line 69-70 */
mounting_holes_center_distance=19;

difference() {
  union() {
    cylinder(d=base_diameter, h=base_thickness, $fn=40);
    cylinder(d=shaft_diameter, h=shaft_thickness+base_thickness, $fn=40);
  }
  translate([0,0,base_thickness+shaft_thickness-nut_thickness])
    cylinder(d=nut_key_width*2/sqrt(3), h=nut_thickness, $fn=6);

  cylinder(d=bore_diameter, h=base_thickness+shaft_thickness, $fn=40);

  for(i=[0:3]) {
    rotate([0,0,i*90])
      translate([mounting_holes_center_distance/2,0,0])
        cylinder(d=mounting_holes_diameter, h=base_thickness, $fn=40);
  }
}
