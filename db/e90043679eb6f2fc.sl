{- PenAngle ; as pan control -}
1:16.collect { :vc |
	EqPan2(
		Blip(PenX(vc) * 220 + 220, PenY(vc) * 4 + 1),
		PenAngle(vc) * 2 - 1
	) * PenZ(vc) * PenDown(vc)
}.Mix
