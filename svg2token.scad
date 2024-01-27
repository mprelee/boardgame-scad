use <morphology.scad>;

module svg2token(height,margin,etch,file) difference() {
    linear_extrude(height) dilation(margin) hull() import(file);
    translate([0,0,height-etch]) linear_extrude(etch) import(file);
}

_TEST=true;
if(_TEST) {
    svg2token(height = 4, margin = 2, etch = 1, file = "noun-ra-4282629.svg");
}