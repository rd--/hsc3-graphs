-- rShufflerB ; controls
let b = control_m KR "buf" 0 (0,10,"lin")
    k nm def = control_m KR nm def
    k2 nm (d1,d2) = control_rng KR nm (d1,d2)
    k2_mul m (c1,c2) = (c1 * m,c2 * m)
    rShufflerB_grp p1 (p2,p3) (p4,p5) (p6,p7) (p8,p9) (p10,p11) (p12,p13) (p14,p15) (p16,p17) p18 p19 p20 = X.rShufflerB p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20
in rShufflerB_grp b
   (k2 "loc" (0.0,0.5) (0,1,"lin"))
   (k2 "incr" (0.99975,1.00025) (0.25,4,"lin"))
   (k2_mul 0.001 (k2 "dur" (250,300) (0.1,1000,"exp")))
   (k2 "amp" (0.8,0.9) (0.5,1.0,"amp"))
   (k2 "shape" (0.5,0.6) (0,1,"lin"))
   (k2 "skew" (0.4,0.6) (0,1,"lin"))
   (k2 "pan" (0.0,1.0) (0,1,"lin")) -- ie. not (-1,1)
   (k2_mul 0.001 (k2 "iot" (50,52.5) (0.01,500,"exp")))
   (k "locIncr" 1.0 (0.25,4.0,"lin"))
   (k "incrQ" 0.0 (0,1,"lin"))
   (k "iotQ" 0.0 (0,1,"lin"))
