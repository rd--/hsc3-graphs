{- Event control ; Kyma keyboard names -}
(1 .. 16).collect { :vc |
	let freq = KeyPitch(vc).UnitCps + LfNoise2(0.25);
	let amp = Asr(KeyDown(vc), 0.1, 2, -4) * KeyVelocity(vc); {- Latch(KeyVelocity(vc), KeyDown(vc)) -}
	Lpf(Saw(freq), KeyTimbre(vc) + 0.1 * freq * 8) * amp
}.Splay2
