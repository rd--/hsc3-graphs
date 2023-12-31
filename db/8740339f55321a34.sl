(* SfPlay ; 2 min (adc) ; https://www.listarc.cal.bham.ac.uk/lists/sc-users-2002/msg00736.html *)
var sf = SfAcquireMono('floating_1');
var l = XLine(1, 0.007, 120);
SfPlay(sf, Decay(Dust(1 / (l * l)) * l.Sqrt, 1), 1, l, 1)
