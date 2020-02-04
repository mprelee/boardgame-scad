// Oath: Chronicles of Empire and Exile
// core.scad 
// Matt Prelee, 2020-02-03

// Poker chip size
POKER_R=19.5;
POKER_H=3.3;
MINI_R=.6*POKER_R;
TEXT_DEPTH=0.8;
FONT="CMU Serif:Italic";

FAVOR="f"; 
MAGIC="m";     

module ring(or,ir,h) difference() {
    cylinder(r=or,h=h,$fn=100);
    cylinder(r=ir,h=h,$fn=100);
}

module imprint(itext,r,depth=TEXT_DEPTH,font=FONT) {
    ring(0.9*r,0.8*r, depth);
    translate([-0.1*r,0,0]) 
        linear_extrude(depth) text(itext, size=r, font=font,
            halign="center",valign="center",$fn=100);
}

module coin(r,h,itext,depth=TEXT_DEPTH) difference() {
    translate([0,r,0]) cylinder(r=r,h=h,$fn=100);
    union() {
        translate([0,r,0]) mirror([0,180,0]) 
            imprint(itext,r);
        rotate([0,0,180]) translate([0,-r,h-depth]) 
            imprint(itext,r);
    }
}
