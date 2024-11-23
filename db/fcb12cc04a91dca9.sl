/* https://anticapitalist.party/@ahihi/113238943073232286 */
let withDelayed = { :in :delayTime :feedbackMultiplier |
	FeedforwardFeedbackward(in, +) { :x |
		DelayN(x, delayTime, delayTime) * feedbackMultiplier
	}
};
let r0 = 7;
let root = 45;
let bass = Impulse(r0, 0).in { :t |
	[
		SinOsc(
			[
				Perc(t, 0, 0.013, 0).LinLin(0, 1, 0, 12 * 3),
				Sequencer([0, 0, -2, -2, 0, 0, 3, 3], Impulse(r0 / (3 * 8), 0)),
				root
			].sum.MidiCps,
			0
		),
		Sequencer([1, 0, 0.35], t),
		Perc(t, 0.01, 0.13, 0)
	].product
};
let padd = 3 * 8;
let padt = padd / r0;
let pad = Impulse(r0 / padd, 0).in { :t |
	[
		SinOsc(
			[
				Sequencer(
					[19, 15, 10, 17, 19, 15, 14, 22],
					t
				),
				root,
				SinOsc(2.4, 0) * 0.18,
				[0.06, -0.06]
			].sum.MidiCps,
			0
		),
		Saw(r0 / padd).Lag(0.1).LinLin(-1, 1, 0, 1),
		SinOsc(2.7, 0).LinLin(-1, 1, 0.4, 1)
	].product.withDelayed(4 / 12 * padt, 0.7) * 0.77
};
let mel = Impulse(r0, 0).in { :t |
	let u = Impulse(r0 / (3 * 16), 0);
	EqPan2(
		[
			SinOsc(
				[
					Sequencer([0, 1, 2, 1, 3], t).Select(
						[
							Sequencer([0, -2, 0, 3], u),
							Sequencer([7, 5, 7, 10], u),
							Sequencer([12, 10, 12, 14], u),
							Sequencer([15, 14, 15, 17], u)
						]
					),
					Sequencer([1, 2, 3, 2], t) * 12,
					root
				].sum.MidiCps, 0),
				Perc(
					t,
					TExpRand(0.002, 0.05, t),
					TExpRand(0.05, 0.11, t),
					0
				) ^ 2,
				Sequencer([1, 1, 0, 1, 1, 1, 0], t)
			].product,
			TRand(-0.7, 0.7, t)
		).withDelayed(2.01 / 24 * padt, 0.65) * 0.3
	};
	bass + pad + mel * 0.25
