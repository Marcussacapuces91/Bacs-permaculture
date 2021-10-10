module rectangle(larg = 600, long = 1200, haut = 140, ep = 26) {
    for (i=[-1,1]) {
        echo("Planche", haut, "x", ep, "x", long - 2*ep);
        translate([0, i * (larg/2 - 10), 0]) cube([long - 2*ep, ep, haut], center=true);
        translate([i * (long / 2 + 20 - ep), 0, 0]) cube([ep, larg, haut], center=true);
    }
}


module bac_int(larg = 1, long = 2, haut = 3, pied = 900) {
    planche = [140,26];
    for (z=[0:haut-1]) translate([0,0, z * (planche[0]+5)]) rectangle(larg * 600, long * 600, planche[0], planche[1]);

// Pieds extrémités
    for (x=[-1,1], y=[-1,1]) translate([x*(long*300+20-2*planche[1]),y*(larg*300-planche[0]/2-planche[1]),haut*planche[0]-(pied+planche[0])/2]) cube([planche[1], planche[0], pied], center=true);

// Pieds latéraux
    for (x=[-1,1], y=[-1,1]) translate([x*(long*300+20-planche[0]),y*(larg*300-1.5*planche[1]),haut*planche[0]-(pied+planche[0])/2]) cube([planche[0], planche[1], pied], center=true);

// Pieds intermediaires
*    for (x=[0:long/2-2], y=[-1,1]) translate([(3*x-0*long/2)*300,y*(larg*300-1.5*planche[1]),haut*planche[0]-(pied+planche[0])/2]) cube([planche[0], planche[1], pied], center=true);

// Planches du fond
    for (i=[1:2*long]) {
        translate([-2.5-planche[0]/2+i*(planche[0]+5), 0, 0]) cube([planche[0], larg*600-planche[1]*2, planche[1]], center=true);
        translate([2.5+planche[0]/2-i*(planche[0]+5), 0, 0]) cube([planche[0], larg*600-planche[1]*2, planche[1]], center=true);
    }
    
    for (y=[50-larg*300,larg*300-50]) translate([0,y,-40]) cube([long*600,40,40], center=true);
}

for (y=[-1:1]) translate([0,y*800,0]) bac_int(larg=1, long=y+2);
