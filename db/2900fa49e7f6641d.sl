{- http://fredrikolofsson.com/f0blog/more-sc-twitter/ F0 ; 0059 -}
let o = SinOsc(
	Saw(3) * 128 + 128,
	(Saw([3, 4]) * (LfTri(LfTri(0.1, 0) * 8 + 12, 0) * 32 + 128)).Sin
) / 4;
CombN(o, 1, 1 / 6, LfTri(1 / 32, 0) + 1)
