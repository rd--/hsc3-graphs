;; Blip ; event control ; i=o ii=rx iii=ry
var f = { :e |
	EqPan2(Blip(e.p.UnitCps, e.y * 10 + 1), e.o * 2 - 1) * e.w * e.z * e.z
};
Voicer(16, f).sum
