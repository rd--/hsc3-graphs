/* https://sonomu.club/@lukiss/113019188464159465 ; Aug 25, 2024, 07:45 */
let k = 2 ^ StandardN([1.1, 0.9], 1, 0.5, 0) * 8;
Splay(
	LeakDc(
		StandardN(StandardN(k, 1, 0.5, 0).Max(0) * 22050, k.Sin, 0.5, 0) / 4,
		0.995
	),
	StandardN(k.sum, 1, 0.5, 0)
)
