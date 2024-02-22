{- 20061015 ; rd ; requires=EnvBreakPoint -}
let ls = { :ts :bp |
	EnvGen(1, 1, 0, ts, 2, EnvBreakPoint(bp, 0).asList)
};
{
	let ts = 21;
	let f = ls(ts, [{ Rand(50, 55) } ! 2, 0.33, { Rand(50, 65) } ! 2, 1, { Rand(50, 55) } ! 2]);
	let g = ls(ts, [0, 0.33, { Rand(0.01, 0.035) } ! 2, 1, 0]);
	Saw(f) * g
} !> 8
