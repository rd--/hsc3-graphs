(********** Ring modulated and resonant filtered input ; Jmcc **********)
let input = AudioIn([1, 2]) * 0.2;
let modulator = SinOsc(
	MouseX(10, 4000, 1, 0.2), (* mouse x controls ring mod freq *)
	[0, 0.5.pi] (* offset phase ofone osc by 90 degrees *)
);
Rlpf(
	input * modulator, (* do ring modulation *)
	MouseY(100, 12000, 1, 0.2), (* mouse y controls cutoff freq *)
	0.1) (* bandwidth ratio = 1/Q *)
