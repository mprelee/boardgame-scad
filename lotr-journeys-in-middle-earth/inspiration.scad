// Source taken from @arifshefi
//   https://www.myminifactory.com/object/3d-print-maple-leaf-57574
//

r = 5;
h = 2;
margin = r;
s = 100;

sp=s+2*margin;

module leaf() {
    union() {
        import("maple-leaf.stl");
        translate([-margin,-margin,-h*3/4])
        minkowski() {
            cube([sp-2*r,sp-2*r,h/2]);
            cylinder(h=h/4,r=r,$fn=200);
        }
    }
}

scale([.2,.2,1]) leaf();
