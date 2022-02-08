// Mix ; summing ; phase cancellation (silence)
Mix.ar([SinOsc.ar(#[440, 441], #[0, pi]), SinOsc.ar(#[440, 441], #[pi, 0])])
