(* Blip ; event control ; shared parameter *)
var nh = 1;
Voicer(1, 16) { :e |
	Blip(e.p.UnitCps, nh) * e.w * e.z
}.Splay
