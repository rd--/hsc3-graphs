/* Blip ; Event control ; Shared parameter */
let nh = 1;
Voicer(1, 16) { :e |
	Blip(e.p.UnitCps, nh) * e.w * e.z
}.Splay
