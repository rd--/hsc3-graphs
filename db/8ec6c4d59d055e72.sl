{- pkt 07 (f0) ; https://fredrikolofsson.com/f0blog/pact-februari/ ; helper -}
let sinOsc = { :f :l :r |
	LinExp(SinOsc(f, 0), -1, 1, l, r)
};
GVerb(
	LeakDc(
		SinOsc(
			SinOsc(
				SinOsc(
					SinOsc(
						SinOsc(
							SinOsc(
								SinOsc(1, 0) * 2 + sinOsc(1 / 2, 1, 2),
								0
							) * 8 +	sinOsc(1 / 4, 4, 8),
							0
						) * 32 + sinOsc(1 / 8, 16, 32),
						0
					) * 128 + sinOsc(1 / 16, 64, 128),
					0
				) * 512 + sinOsc(1 / 32, 256, 512),
				0
			) * 2048 + sinOsc(1 / 64, 1024, 2048),
			0
		) * 0.1,
		0.995
	),
	16, 8, 0.75, 0.5, 15, 1, 0.7, 0.5, 300
) * 0.25
