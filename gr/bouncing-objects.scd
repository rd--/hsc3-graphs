// bouncing lightbulbs, pencils, cans, and other assorted objects

"/home/rohan/sw/hsc3-graphs/gr/overlap-texture.scd".load;

~spawn.({
    var e = Env.new([1, 1, 0],[3, 0.001]); // 3 second cut off envelope to end sound
    Pan2.ar(
        // resonant filter bank simulates resonant modes of bouncing objects
        Klank.ar(
            `[
                Array.fill(4, { 400 + 8000.0.rand }), // resonant freqs
                Array.fill(4, { 1.0.rand }), // amplitudes
                Array.fill(4, { 0.01 + 0.1.rand })  // ring times
            ],
            // decays excite filter bank
            Decay.ar( // each impulse triggers a decay
                Impulse.ar( // impulses trigger decay envelope
                    XLine.kr(5 + 2.0.rand2, 600, 4), // accellerating frequency
					0,
                    XLine.kr(0.09, 0.000009, 4) // decaying impulse amplitude
                ),
                0.001 // decay time - very short
            )
        ),
        1.0.rand2 // place each bouncer at a random position in the stereo field
    )
    * // multiply by an envelope is necessary to make the sound end
    EnvGen.kr(e)
}, nextTime: { 0.6 + 0.6.rand });
