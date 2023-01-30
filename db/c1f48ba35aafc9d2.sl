;; use of dust with rising sounds ; https://github.com/cianoc/supercollider_fragments ; Rand
{
	var s = RingzBank(Dust(1 / 3) * 0.1, { ExpRand(1000, 10000) } ! 3, [1], { Rand(1, 4) } ! 15);
	Pan2(s, LfTri(Rand(3, 10), 0), 0.1)
} !+ 20
