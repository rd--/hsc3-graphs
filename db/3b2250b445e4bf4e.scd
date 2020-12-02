// MiElements ; blow ; contour
{var gate = LFPulse.kr(1, 0.01);
 var pitch = SinOsc.kr(5,0,0.1, 53);
 var cont = SinOsc.kr(0.8).range(0,1);
 var flow = LFNoise1.kr(0.1).range(0,1);
 MiElements.ar(gate: gate, pit: pitch, contour: cont, blow_level:0.5, flow: flow, blow_timb: 0.3, bright:0.3, damp:0.8)}
