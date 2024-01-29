use <morphology.scad>;

module svg2token(height,margin,etch) difference() {
    linear_extrude(height) dilation(margin) hull() children(0);
    translate([0,0,height-etch]) linear_extrude(etch) children(0);
}
