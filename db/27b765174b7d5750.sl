/* Fm7 ; three set of six output channels (18 channels) */
{
	let freq = LfNoise0(3).ExpRange(200, 310);
	let ctlMatrix = [
		[freq, 0, 1],
		[freq, 0, 1],
		[LfNoise2(0.5).ExpRange(3, 80), 0, 1],
		[LfNoise2(0.5).ExpRange(3, 800), 0, 1],
		[LfNoise2(0.5).ExpRange(3, 800), 0, 1],
		[LfNoise2(0.5).ExpRange(0.3, 10), 0, 1]
	];
	let x = MouseX(0, 3, 0, 0.2);
	let modMatrix = {
		{
			LfNoise1(0.5).Max(0)
		} ! 6 * x
	} ! 6;
	Fm7Matrix(ctlMatrix, modMatrix) * -18.DbAmp
} !> 3
