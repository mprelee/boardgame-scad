// All functions are form FUNCTION() SOURCE; KERNEL;
KERNEL_DEFAULT="circle";
$fn=100;
module _kernel(r,kernel=KERNEL_DEFAULT) 
    if(kernel=="circle") {circle(r);}
    else if(kernel=="square") {square(sqrt(2)*r);}
    else if(kernel=="sphere") {sphere(r);}
    else if(kernel=="cylinder") { cylinder(r=r,h=r);}
module dilation(r, kernel=KERNEL_DEFAULT) 
    minkowski() {_kernel(r,kernel); children(0);}
module outset(r,kernel=KERNEL_DEFAULT) 
    difference() {
        dilation(r,kernel) children(0);
        children(0);}
module inset(r,kernel=KERNEL_DEFAULT) 
    difference() {
        dilation(r,kernel) outset(r,kernel) children(0);
        outset(r,kernel) children(0);}
module inset(r,kernel=KERNEL_DEFAULT) 
    intersection() {
        dilation(r,kernel) outset(r,kernel) children(0); 
        children(0);}
module erosion(r,kernel=KERNEL_DEFAULT) 
    difference() {
        children(0);
        inset(r,kernel) children(0);}
module shell(r,kernel=KERNEL_DEFAULT) 
    difference() {
        dilation(r,kernel) opening(r,kernel) children(0);
        opening(r,kernel) children(0); }
module xyz(r,kernel=KERNEL_DEFAULT) 
    difference() {
        closing(r,kernel) children(0); 
        erosion(r,kernel) closing(r,kernel) children(0);
}
module opening(r,kernel=KERNEL_DEFAULT) dilation(r,kernel) erosion(r,kernel) children(0);
module closing(r,kernel=KERNEL_DEFAULT) erosion(r,kernel) dilation(r,kernel) children(0);

//module test() {
//
//    $fn=100;
//    KERNEL="circle";
//    module target(i=1) {
//        if(i==1) {
//            square(8);
//        }
//        else if(i==2) {
//            scale(0.25) import("noun-war-2916881.svg");
//        }
//    }
//
//    translate([ 0, 0,0])             target();  
//    translate([20, 0,0]) dilation(3) target();  
//    translate([40, 0,0]) outset(3)   target();  
//    translate([ 0,20,0]) inset(3)    target();  
//    translate([20,20,0]) erosion(3)  target();  
//    translate([40,20,0]) shell(3)    target();  
//
//    translate([ 0,40,0]) opening(3)  target();  
//    translate([20,40,0]) closing(3)  target();  
//    //translate([40,40,0]) xyz(3)  target(8);  
//
//}
//test();