(* SfPlay ; recursive scrubbing (adc) ; https://www.listarc.cal.bham.ac.uk/lists/sc-users-2002/msg00736.html *)
var sf = SfAcquireMono('floating_1');
var r = 10;
(1 .. 6).do { :i |
	r := LfNoise1(0.2 ^ i * 50) * r
};
SfPlay(sf, r, 1, [0, 18000], 1)
