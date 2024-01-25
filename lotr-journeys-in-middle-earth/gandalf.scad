// Source taken from @arifshefi
//   https://www.myminifactory.com/object/3d-print-maple-leaf-57574
//

r = 5;
h = 2;
s = 20;

margin = r;

sp=s+2*margin;
FONT="Cirth Erebor";

module leaf() {
    difference() {
        translate([r,r,0])
        minkowski() {
            cube([sp-2*r,sp-2*r,h/2]);
            cylinder(h=h/4,r=r,$fn=200);
        }
        translate([s*3/4,s*3/4,0])
        linear_extrude(h) text("r", size=3*r, font=FONT,
            halign="center",valign="center",$fn=100);
    }
}

leaf();
