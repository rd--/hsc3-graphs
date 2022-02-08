// Mix ; phase-shifting ; mouseX delay control
var p = SinOsc.ar(#[440, 441], #[0, pi]) * 0.1;
var q = DelayN.ar(SinOsc.ar(#[440, 441], #[pi, 0]), ControlDur.ir() * 2, MouseX.kr(0, ControlDur.ir() * 2, 0, 0.2)) * 0.1;
Mix.ar([p, q])
