"sinOsc ; with frequency of zero, operates as table lookup variant of sin"
|mk_phasor ph o1 o2 o3|
mk_phasor := [:l :r :f | Phasor trig: 0 rate: (SampleDur new * (r - l) * f) ir start: l end: r resetPos: l] .
ph := mk_phasor value: 0 value: Float pi * 2 value: 440 .
o1 := SinOsc freq: 440 phase: 0 .
o2 := SinOsc freq: 0 phase: ph .
o3 := ph sin .
{o1 . XFade2 inA: o2 inB: o3 pan: (LFTri freq: 0.1 iphase: 0) kr level: 1} mce * 0.1
