{- Event control ; Kyma keyboard names -}
1:16.collect { :vc |
	SinOsc(KeyPitch(vc).UnitCps, 0) * KeyDown(vc) * KeyVelocity(vc)
}.Splay2
