"bit-reduction (adc)"
| f nh src sr bitSz downSample bitRedux |
f := LfNoise2 freq: 8 mul: 200 add: 300.
nh := LfNoise2 freq: 3 mul: 10 add: 20.
src := Blip freq: f kr numharm: nh kr.
sr := MouseX minval: 1000 maxval: SampleRate new * 0.1 warp: 1 lag: 0.2.
bitSz := MouseY minval: 1 maxval: 24 warp: 1 lag: 0.2.
downSample := Latch in: src trig: (Impulse freq: sr phase: 0).
bitRedux := downSample roundTo: 0.5 ** bitSz.
{downSample. bitRedux}
