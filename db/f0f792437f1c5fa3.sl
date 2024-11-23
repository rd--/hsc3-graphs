/* https://sonomu.club/@lukiss/113012278480517510 ; Aug 24, 2024, 02:28 */
let p = [1, 3 .. 64];
let r = 2 ^ (Logistic(3.9, 3, 0.5) + 1 * 2.1).Floor;
let e = Linen(TDuty(1 / r, 0, 1).kr, 0, 1, 0.9 / r, 0);
Splay(
	Blip(
		73 * p * p.degreesToRadians,
		Blip(r / p, 0) + 1 / 2 ^ 2 * 33
	).Sin * ((1 - e * p).Log.Sin.Sin ^ (Blip(0.1 / r, 0) + 2 * 2)).Sanitize(0) * (e > 0.1),
	Blip(r, 0.1)
)
