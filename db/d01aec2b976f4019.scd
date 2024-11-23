// https://sonomu.club/@lukiss/113019188464159465 ; Aug 25, 2024, 07:45
var k = 2 ** StandardN.ar([1.1, 0.9], 1, 0.5, 0) * 8;
Splay.ar(
	LeakDC.ar(StandardN.ar(StandardN.ar(k, 1, 0.5, 0).max(0) * 22050, k.sin, 0.5, 0) / 4, 0.995),
	StandardN.ar(k.sum, 1, 0.5, 0)
)
