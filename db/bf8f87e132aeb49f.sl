{-********* Analog bubbles ; with mouse control ; Jmcc *********-}
let freq = LfSaw(
	MouseY(0.1, 10, 1, 0.2), 0).MulAdd( {- lfo 1 rate -}
		24, {- lfo 1 depth in semitones -}
		{- lfo 2 in lfo 1's add input -}
		LfSaw(
			MouseX(2, 40, 1, 0.2), 0).MulAdd( {- lfo 2 rate -}
				-3, 80) {- lfo 2 depth & offset in semitones -}
	).MidiCps; {- convert to frequency -}
CombN(SinOsc(freq, 0) * 0.04, 0.2, 0.2, 2) {- echoing sine wave -}
