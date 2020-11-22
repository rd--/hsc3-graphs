// Balance2
{Balance2.ar(LFSaw.ar(44),Pulse.ar(33),FSinOsc.kr(0.5),0.1)}

// Balance2
{var o=SinOsc.ar([440,550]);Balance2.ar(o[0],o[1],LFNoise0.kr(4),0.3)}

// Balance2
{var o=SinOsc.ar(440);Out.ar(0,0.2*Balance2.ar(o,o,SinOsc.kr(0.2)))}

// Balance2
{var o=SinOsc.ar(440);Out.ar(0,Balance2.ar(o,o,SinOsc.kr(0.2),0.2))}

// Balance2
{var o=SinOsc.ar(440);Out.ar(0,Balance2.ar(o,o,MouseX.kr(-1,1),0.2))}

// CrossoverDistortion
{CrossoverDistortion.ar(SinOsc.ar([400, 404], 0, 0.2), MouseX.kr(0, 1), MouseY.kr(0, 1))}

// CrossoverDistortion
{CrossoverDistortion.ar(SoundIn.ar, MouseX.kr(0, 1), MouseY.kr(0, 1))}

// DynKlank
{s=`[[800,1071,1153,1723],nil,[1,1,1,1]];DynKlank.ar(s,Impulse.ar(2,0,0.1))}

// DynKlank
{s=`[[800,1071,1353,1723],nil,[1,1,1,1]];DynKlank.ar(s,Dust.ar(8,0.1))}

// DynKlank
{s=`[[800,1071,1353,1723],nil,[1,1,1,1]];DynKlank.ar(s,PinkNoise.ar(0.007))}

// DynKlank
{s=`[[200,671,1153,1723],nil,[1,1,1,1]];a=[0.007,0.007];DynKlank.ar(s,PinkNoise.ar(a))}

// Env.adsr
{SinOsc.ar * EnvGen.kr(Env.adsr(0.75, 2.75, 0.1, 7.25, 1, -4, 0))}

// FreqShift
{var a = Blip.ar(60,4,LFGauss.ar(4,1/8))
;var b = a / 4 + LocalIn.ar(2)
;var c = FreqShift.ar(b,LFNoise0.kr(1/4,90))
;LocalOut.ar(DelayC.ar(c,1,0.1,0.9))
;c}

// Klang
{Klang.ar(`[[800,1000,1200],[0.3,0.3,0.3],[pi,pi,pi]],1,0)*0.4}

// Klang
{Klang.ar(`[[800,1000,1200],nil,nil],1,0)*0.25}

// Klang
{Klang.ar(`[Array.rand(12,600.0,1000.0),nil,nil],1,0)*0.05}

// Line - NOTE: doneAction input is placed AFTER mul and add inputs
{SinOsc.ar(Line.kr(200,17000,10,doneAction: 1),0) * 0.1}

// LinExp
{var mod = SinOsc.kr(Line.kr(1, 10, 10))
;[SinOsc.ar(mod * 400 + 500),SinOsc.ar(LinExp.kr(mod, -1,1, 100, 900))] * 0.1}

// LinXFade2
{LinXFade2.ar(FSinOsc.ar(800, 0, 0.2), PinkNoise.ar(0.2), FSinOsc.kr(1))}

// MiBraids ; basic example
{MiBraids.ar(60, 0.5, 0.5, 6, mul: 0.05)!2}

// MiBraids ; some modulation
{var mod = LFNoise1.kr(0.5,0.5,0.5); MiBraids.ar(40, mod, 0, 1, mul: 0.05) ! 2}

// MiBraids ; vosim
{var pit = LFNoise0.kr(4).range(33, 66).round;
 var timb = LFNoise1.kr(0.3,0.5,0.5);
 var color = LFNoise1.kr(0.3,0.5,0.5);
 MiBraids.ar(pit, timb, color, 21, mul: 0.1) ! 2}

// MiBraids ; fluted
{var pit = 38;
 var timb = MouseX.kr(0.7,1);
 var color = MouseY.kr();
 MiBraids.ar(pit, timb, color, 31, resamp: 1, mul: 0.1) ! 2}

// MiBraids ; scanning
{var timb = LFNoise1.kr(0.3,0.5,0.5);
 var color = LFNoise1.kr(0.3,0.5,0.5);
 var pit = MouseY.kr(33,72);
 var model = MouseX.kr(0, 47);
 MiBraids.ar(pit, timb, color, model, mul: 0.1) ! 2}

// MiBraids ; paraphonic
{var timb = LFNoise1.kr(0.03,0.5,0.5);
 var color = LFNoise1.kr(0.05,0.5,0.5);  // chord
 MiBraids.ar(38, timb, color, 40, resamp: 1, mul: 0.1) ! 2}

// MiBraids ; trigger (plugged)
{var trig = Dust.kr(0.6);
 var pit = TRand.kr(45,72,trig).round;
 var timb = 0.5;
 var color = LFNoise1.kr(0.3,0.5,0.5);
 MiBraids.ar(pit, timb, color, 28, trig, mul: 0.1) ! 2}

// MiBraids ; kick
{var trig =  Impulse.kr(4);
 var pit = Latch.kr(PinkNoise.kr(), trig).range(30, 50).round;
 var timb = LFNoise1.kr(0.4,0.5,0.5);
 var color = LFNoise1.kr(0.3,0.5,0.5);
 MiBraids.ar(pit, timb, color, 34, trig, mul: 0.2) ! 2}

// MiBraids ; sample rate, bit reduction and distortion
{var trig =  CoinGate.kr(0.3, Impulse.kr(4));
 var decim = TRand.kr(1,32,trig);
 var dist = LFTri.kr(0.2).range(0,1);
 MiBraids.ar(40, 0.7, 0.7, 34, trig, resamp: 2, decim: decim, bits: 3, ws: dist, mul: 0.1) ! 2}

// MiClouds ; basic granulation ; requires=buf (stereo)
{arg buf = 0;
 var nc = 2;
 var input = PlayBuf.ar(nc, buf, 1, loop: 1);
 var dens = LFNoise1.kr(0.3).range(0.3, 0.45);
 MiClouds.ar(input, 0, 0, 0, dens, 0.5, drywet: 1, mode: 0)}

// MiClouds
{var imp = Dust.ar([0.8,1.1]);
 var freq = Latch.ar(PinkNoise.ar(24,80), imp).midicps;
 var input = RLPF.ar(imp, freq, 0.002, 4);
 var pit = LFNoise1.kr(0.3,12);
 var pos = LFNoise2.kr(0.4,0.5,0.5);
 var size = LFNoise1.kr(0.3,0.5,0.5);
 var dens = LFNoise1.kr(0.3,0.5,0.5);
 var tex = LFNoise1.kr(0.3,0.5,0.5);
 var frez = LFClipNoise.kr(0.3);
 MiClouds.ar(input, pit, pos, size, dens, tex, drywet: 0.5, in_gain: 2, rvb:0.3, fb: 0.8, freeze: frez, lofi: 1, mode: 0)}

// MiClouds ; using external grain trigger
{arg buf = 0;
 var nc = 2;
 var input = PlayBuf.ar(nc, buf, 1, loop: 1);
 var dens = 0.5;
 var trig = Dust.kr(10);
 MiClouds.ar(input, -5, 0, 0.2, dens, 0.5, trig: trig, drywet: 1, mode: 0)}

// MiClouds ; spectral mode (this mode causes high CPU peaks)
{arg buf = 0;
 var nc = 2;
 var input = PlayBuf.ar(nc, buf, 1, loop: 1);
 var size = 0.35;
 var dens = 0.02;
 var tex = 0.3;
 MiClouds.ar(input, 0, 0, size, dens, tex, drywet: 1, rvb: 0.8, fb: 0.8, mode: 3) * 0.35}

// MiClouds ; more spectral stuff ; watch volume
{arg buf = 0;
 var nc = 2;
 var input = PlayBuf.ar(nc, buf, 1, loop: 1);
 var size = LFNoise1.kr(0.2).range(0.1,0.5).squared;
 var dens = LFNoise1.kr(0.3,0.5,0.5);
 var tex = LFNoise1.kr(0.3,0.5,0.5);
 MiClouds.ar(input, 0, 0, size, dens, tex, drywet: 1, rvb: 0.6, fb: 0.6, lofi: 1, mode: 3) * 0.25}

// MiElements ; basic
{var input = PinkNoise.ar(0.3);
 var gate = LFPulse.kr(2);
 var pitch = 45;
 MiElements.ar(input, 0, gate, pitch)}

// MiElements ; ringing ; use 'blow' input and contour set to 0.5
{var input = PinkNoise.ar(0.3);
 var gate = 1;
 MiElements.ar(input, 0, gate, 48, contour:0.5)}

// MiElements ; ringing ; use the 'strike' input (which bypasses the exciter section)
{var input = PinkNoise.ar(0.3);
 MiElements.ar(0, input, 0, 48)}

// MiElements ; bow
{var mod = LFNoise1.kr(0.3,0.5,0.5);
 MiElements.ar(gate: 1, pit: 32, contour: 0.5, bow_level: 1, bow_timb: mod) * 0.25}

// MiElements ; blow
{var mod1 = LFNoise1.kr(0.4,0.5,0.5);
 var mod2 = LFNoise1.kr(0.2,0.5,0.5);
 var pit = LFNoise0.kr(0.1).range(32,44);
 MiElements.ar(gate: 1, pit: pit, contour: 0.5, blow_level: 0.6, flow: mod1, blow_timb: mod2) * 0.2}

// MiElements ; blow ; contour
{var gate = LFPulse.kr(1, 0.01);
 var pitch = SinOsc.kr(5,0,0.1, 53);
 var cont = SinOsc.kr(0.8).range(0,1);
 var flow = LFNoise1.kr(0.1).range(0,1);
 MiElements.ar(gate: gate, pit: pitch, contour: cont, blow_level:0.5, flow: flow, blow_timb: 0.3, bright:0.3, damp:0.8)}

// MiElements ; metal, bells
{var trig = Dust.ar(2.5);
 var input = Decay.ar(trig, 0.01);
 var g = TBrownRand.ar(0.5, 0.9, 0.2, trig: CoinGate.ar(0.05, trig));
 var space = LFNoise1.kr(0.1).range(0.5, 1);
 MiElements.ar(0, input, 0, 40, geom: g, bright:0.4, damp:0.9, space: space)}

// MiElements ; strike input ; playing chords ; model=strings
{var input = Decay.ar(Dust.ar(1), 0.01);
 var g = LFNoise1.kr(0.1,0.5,0.5);
 MiElements.ar(0, input, pit: 53, geom: g, bright:0.5, damp:0.9, model:2)}

// MiElements ; mallets ; strength
{var gate = CoinGate.kr(0.4, Impulse.kr(6));
 var stren = TRand.kr(trig: gate);
 var strike_timbre = LFNoise1.kr(0.3,0.5,0.5);
 MiElements.ar(gate: gate, pit:40, strength: stren, strike_level: 0.5, mallet:0.7, strike_timb: strike_timbre, bright: 0.3, damp: 0.85, space: 0.6)}

// MiElements ; mallets ; particles
{var strike_timbre = LFNoise1.kr(0.3,0.5,0.5);
 var g = LFNoise2.kr(0.1).range(0.4,0.7);
 var maltype = 1;     // mallet type: 1 --> uses internal model of bouncing particles
 MiElements.ar(gate: 1, pit:40, geom: g, contour:0.5, strike_level: 0.5, mallet: maltype, strike_timb: strike_timbre)}

// MiElements ; easteregg: 2x2-op FM synth
{var mod = LFNoise1.kr(0.3,0.5,0.5);
 var ratio = 0.25;
 var ratio2 = 0.25;
 var ratio3 = 0.51;
 MiElements.ar(gate:1, contour: 0.5, pit: 48, bow_level: ratio, blow_level: 0.6, strike_level: 0.5, flow: ratio2, mallet: ratio3, bow_timb: mod, blow_timb: 0.3, strike_timb: 0.6, strength: 0.9, geom: 0.12, bright: 0.6, damp: 0.5, space: 0.7, easteregg: 1)}

// MiOmi ; basic
{MiOmi.ar(pit: 50, level1:1, level2:0.5, ratio1:0.49, fm1:0.5) * 0.25}

// MiOmi ; external FM
{var fmfreq = MouseX.kr(2, 1000);
 var fmamp = MouseY.kr(0, 1);
 var extFM = SinOsc.ar(fmfreq,0,fmamp);
 MiOmi.ar(extFM, pit: 40, fm1: 0.5, fm2: 0.5, xfb: 0.1, cutoff: 0.9)}

// MiOmi ; filter and cutoff modulation
{var filtmod = LFTri.kr(0.23).range(0,1);
 var gate = LFPulse.kr(6,0,0.2);
 var cf = LFTri.kr(0.2).range(0,0.5);
 MiOmi.ar(0, gate, pit: 48, contour: 0.1, fm1: 0.5, fm2: 0.5, fb:0.5, strength: 0, filter_mode: filtmod, cutoff: cf, env: 0.5)}

// MiOmi ; cross feedback
{var xfb = LFTri.kr(0.2).range(0,1);
 MiOmi.ar(pit: 43, xfb: xfb) * 0.25}

// MiPlaits ; basics
{MiPlaits.ar(35, 0, harm: 0.252, morph: 0.2, mul: 0.1)}

// MiPlaits ; Mouse control
{MiPlaits.ar(48, 2, MouseX.kr(0, 1), MouseY.kr(0,1), mul: 0.1)}

// MiPlaits ; some talking
{MiPlaits.ar(MouseY.kr(24,72), 7, MouseX.kr(0, 1),  0.5, LFSaw.ar(0.11, 0, 0.5, 0.5)) * 0.1}

// MiPlaits ; scanning through some engines + vibrato
{var pit = 50;
 var vib = SinOsc.ar(6, 0, 0.3);
 var e = LFNoise0.kr(0.5, 4, 4);
 MiPlaits.ar(pit+vib, e, mul: 0.1)}

// MiPlaits ; some FM
{var harm = MouseX.kr(0, 1);
 var timbre = MouseY.kr(0,1);
 var morph = LFNoise2.kr(0.2).range(0,1);
 var trigger = Impulse.ar(8);
 MiPlaits.ar(48, 2, harm,  timbre, morph, trigger, decay: 0.5) * 0.1}

// MiPlaits ; wavetable + trigger
{var trigger = Impulse.kr(8);
 var harm = LFNoise2.kr(0.3,0.25,0.25);
 var timbre = LFNoise1.kr(0.4,0.5,0.5);
 var dec = LFNoise2.kr(0.2).range(0.01,0.8);
 MiPlaits.ar(44, 5, harm, timbre, 0, trigger, decay: dec, mul: 0.2)}

// MiPlaits ; some chords + trigger + level
{var harm = MouseY.kr(0,1);  // select chord
 var timbre = 0.5;
 var morph = 0.5;
 var trigger = Impulse.kr(6);
 var lev = TRand.kr(trig: trigger);
 MiPlaits.ar(40, 6, harm, timbre, morph, trigger, lev.squared, decay: 0.5, timb_mod: 0.4, mul: 0.1)[0]}

// MiPlaits ; super saw
{var harm = 0.16;
 var timbre = 0;
 var morph = 1;
 var pit = TIRand.kr(39, 49, Dust.kr(0.5));
 MiPlaits.ar(pit, 8, harm, timbre, morph, mul: 0.1)[0]}

// MiPlaits ; slow swarm
{var harm = 0.9;
 var timbre = 0;
 var morph = 0.5;
 MiPlaits.ar(48, 8, harm, timbre, morph) * [0.04,0.15]}

// MiPlaits ; inharmonic string
{var harm = LFNoise2.kr(0.2).range(0,1);
 var timbre = 0.0;
 var morph = 0.85;
 MiPlaits.ar(60, 11, harm, timbre, morph)[0]}

// MiPlaits ; modal resonator + trigger
{var harm = LFNoise2.kr(0.2).range(0,1);
 var timbre = 0.0;
 var morph = 0.85;
 var trigger = Impulse.kr(1);
 var lev = TRand.kr(trig: trigger).squared;
 Mix.new(MiPlaits.ar(56, 12, harm, timbre, morph, trigger, lev))}

// MiPlaits ; snare drumsss
{var harm = LFNoise2.kr(0.5).range(0,0.5);
 var timbre = 0.173;
 var morph = 0.827;
 var trigger = Impulse.kr(8);
 var lev = TRand.kr(trig: trigger).squared;
 MiPlaits.ar(47, 14, harm, timbre, morph, trigger, lev, fm_mod: 0.2, timb_mod: 0.43, decay: 0.4) * 0.1}

// MiPlaits ; filtered noise
{var harm = 0.575;
 var timbre = 0.02;
 var morph = LFNoise1.kr(0.3).range(0.55,0.9); // filter resonance
 MiPlaits.ar(62, 9, harm, timbre, morph) * 0.25}

// MiPlaits ; something...
{var trigger = Dust.kr(LFNoise2.kr(0.1).range(0.1, 7) );
 var harmonics = SinOsc.kr(0.03, 0, 0.5, 0.5).range(0.0, 1.0);
 var timbre = LFTri.kr(0.07, 0, 0.5, 0.5).range(0.0, 1.0);
 var morph = LFTri.kr(0.11, 0, 0.5, 0.5).squared;
 var pitch = TIRand.kr(24, 48, trigger);
 var engine = TRand.kr(0, 15, trig: trigger).round;
 var sub = SinOsc.ar(pitch.midicps, 0, 0.1);
 var mi = MiPlaits.ar( pitch, engine, harmonics, timbre, morph, trigger: trigger, decay: 0.8, lpg_colour: 0.2, mul: 0.5);
 (mi + sub) * 0.2}

// MiRings ; basics
{MiRings.ar(Impulse.ar(1))}

// MiRings ; basics
{MiRings.ar(PinkNoise.ar(0.05), pit: 40)}

// MiRings ; using the 'trig' input to excite the resonator
{MiRings.ar(trig: Dust.kr(0.7), pit: 33, model: 1) * 0.2}

// MiRings ; using the 'pit' input to set MIDI pitch and excite the resonator
{MiRings.ar(pit: LFNoise0.kr(2).range(30, 50), model: 2)}

// MiRings ; sympathetic strings
{var trig = Dust.kr(1);
 var pit = Latch.kr(WhiteNoise.kr(), trig).range(30, 60).round;
 var struct = LFNoise2.kr(0.4).range(0,1);
 MiRings.ar(0, 0, pit, struct, 0.5, 0.7, 0.25, model: 1, poly: 4) * 0.25}

// MiRings ; inharmonic string
{var trig = Dust.kr(3);
 var trigPit = Dust.kr(0.5);
 var pit = Latch.kr(WhiteNoise.kr(), trigPit).range(30, 60);
 var struct = Latch.kr(PinkNoise.kr(), trig).range(0.1,1);
 MiRings.ar(0, trig, pit, struct, 0.5, 0.8, model: 2, poly: 4) * 0.25}

// MiRings ; simple vibrato
{var trig = Dust.kr(0.5);
 var pit = Latch.kr(WhiteNoise.kr(), trig).range(36, 48);
 var vib = SinOsc.kr(3);
 MiRings.ar(0, 0, pit+vib, 0.2, model: 0)}

// MiRings ; 'intern_exciter' OFF
{MiRings.ar(PinkNoise.ar(0.1), Impulse.kr(1), poly: 2) * 0.25}

// MiRings ; 'intern_exciter' ON
{MiRings.ar(PinkNoise.ar(0.1), Impulse.kr(1), intern_exciter: 1, poly: 2) * 0.25}

// MiRings ; intern_exciter ON
{var input = Crackle.ar(1.999, 0.2);
 var trig = Dust.ar(0.7);
 var bright = LFNoise1.kr(0.4).range(0.1,0.8);
 var pos = LFNoise2.kr(0.1).range(0,1);
 MiRings.ar(input, trig, 56, 0.1, bright, 0.6, pos, intern_exciter: 1, model:0, poly: 3) * 0.35}

// MiRings ; 2-op_FM ; 'pos' controls feedback (no fb at 0.5)
{var input = Impulse.kr(6);
 var pitch = Latch.kr(WhiteNoise.kr(), input).range(24, 48).round;
 var brightness = LFNoise1.kr(0.5).range(0.2,0.9);
 var position = LFNoise1.kr(0.4).range(0,0.5);
 var out = MiRings.ar(input, pit: pitch, bright: brightness, pos: position, damp: 0.97, model: 3);
 Splay.ar(out, LFNoise2.kr(0.5).range(-0.5,0.5)) * 0.25}

// MiRings ; sympathetic_string_quantized --> chords
{var input = PinkNoise.ar(0.2);
 var bright = LFNoise2.kr(0.5).range(0.15, 1);
 var struct = LFNoise0.kr(0.2).range(0,1);
 MiRings.ar(input, 0, 40, struct, bright, 0.7, 0.25, model:4, poly: 1) * 0.35}

// MiRings ; string_and_reverb --> spacey ; force 'internal exciter'
{var input = PinkNoise.ar(0.2);
 var trig = Dust.kr(0.7);
 var struct = LFNoise1.kr(0.4).range(0,1);
 var pos = LFNoise2.kr(0.1).range(0,1);
 MiRings.ar(input, trig, 60, struct, 0.5, 0.7, pos, intern_exciter: 1, model:5, poly: 4) * 0.25}

// MiRings ; easter egg
{var trig = Impulse.kr(0.3);
 var pitch = Latch.kr(WhiteNoise.kr(), trig).range(24, 48).round;
 var brightness = LFNoise1.kr(0.5).range(0.2,0.9);
 var position = LFNoise1.kr(0.4).range(0,1);
 MiRings.ar(pit: pitch, bright: brightness, pos: position, damp: 0.8, poly: 1, model: 0, easteregg: 1) * 0.25}

// MiRings ; easter egg --> drone ; set damp to 1.0 to get a sustaining sound that doesn't need to be triggered
{var struct = LFNoise2.kr(0.2).range(0,1);
 var brightness = LFNoise1.kr(0.5).range(0,1);
 MiRings.ar(pit: 40, struct: struct, bright: brightness, pos: 0.9, damp: 1.0, poly: 2, model: 2, easteregg: 1) * 0.25}

// MiRipples ; basic
{MiRipples.ar(Saw.ar(60), 0.4, 0.3)}

// MiRipples
{var cf = LFNoise0.kr(4).range(0, 1);
 MiRipples.ar(Saw.ar(60), cf, 0.6, mul: 0.5)}

// MiRipples ; filter sweep + distortion
{var cf = LFTri.kr(0.03).range(0.1,0.9);
MiRipples.ar(Saw.ar(40), cf, 0.8, 4, 0.2)}

// MiRipples
{var trig = Impulse.ar(4);
 var input = Decay.ar(trig, 0.1);
 var cf = TRand.ar(0.1, 0.6, trig);
 var filt = RLPF.ar(cf, 80, 0.3);
 MiRipples.ar(input, filt, 0.8, drive: 3, mul: 0.5)}

// MiTides ; shape
{var shape = LFTri.ar(0.11).range(0,1);
 MiTides.ar(100, shape, output_mode: 2, mul: 0.5)[0]}

// MiTides ; slope
{var slope = LFTri.ar(0.11).range(0,1);
 MiTides.ar(100, 0.5, slope, output_mode: 2, mul: 0.5)[0]}

// MiTides ; phasing
{var shape = 0.2;
 var slope = 0.0;
 var shift = LFNoise1.ar(0.3).range(0,1);  // slightly shift phases
 var smooth = LFNoise1.kr(0.02).range(0.1, 0.9);
 var out = MiTides.ar(70, shape, slope, smooth, shift, output_mode: 2) * 0.15;
 Splay.ar(out)}

// MiTides ;chords ; tremolo
{var shape = LFTri.ar(0.11).range(0,1);
 var slope = LFTri.ar(0.2).range(0,1);
 var chord = LFNoise1.ar(0.1).range(0.5,1);
 var smooth = SinOsc.ar(LFNoise1.kr(0.2).range(0.1,10)).range(0,0.5);
 var out = MiTides.ar(200, shape, slope, smooth, chord, output_mode: 3, mul: 0.25);
 Splay.ar(out)}

// MiTides ; amplitude mode
{var freq = 0.15;
 var shape = 0.2;
 var slope = 0.2;
 var level = LFTri.ar(0.1).range(0,1);
 var env = MiTides.ar(freq, shape, slope, 0.3, level, output_mode: 1, ramp_mode: 1);
 var sines = SinOsc.ar([200,300,500,900]);
 Splay.ar(sines * env)}

// MiTides ; amplitude ; trigger input
{var freq = LFNoise1.ar(0.8).range(0.2,10);
 var shape = 0.2;
 var slope = 0.2;
 var level = LFNoise1.ar(0.3).range(0,1);
 var trig = LFPulse.ar(2);
 var env = MiTides.ar(freq, shape, slope, 0.3, level, trig: trig, output_mode: 1, ramp_mode: 0);
 var sines = SinOsc.ar([200,300,500,700]);
 Splay.ar(sines * env * 0.5)}

// MiTides ; phasing envs
{var freq = 10;
 var shape = 0.2;
 var slope = 0.5;
 var shift = LFTri.ar(0.1).range(0,1);
 var trig = LFPulse.ar(5);
 var env = MiTides.ar(freq, shape, slope, 0.5, shift, trig: trig, output_mode: 2, ramp_mode: 0);
 var sines = SinOsc.ar([200,300,500,700]);
 Splay.ar(sines * env * 0.25)}

// MiTides ; gate
{var freq = 5;  // attack rate
 var shape = LFTri.ar(0.13).range(0,1);
 var slope = 0.5;
 var smooth = LFTri.ar(0.1).range(0,1);
 var trig = LFPulse.ar(1);
 var env = MiTides.ar(freq, shape, slope, smooth, 0.8, trig: trig, output_mode: 0, ramp_mode: 0);
 var sine = PMOsc.ar(150, 300, 2);
 sine * env[0]}

// MiTides ; Lightbath -- Loom 4
{var bpm = 140;
 var period = (60 / bpm) * 6;
 var speed = 1.0 / period;
 var del_times = period / [6, 8];
 var trig = Impulse.kr(speed);
 var clock = Phasor.kr(trig);
 var pit = TChoose.kr(trig, [67, 60, 65]);
 var shape = LFTri.kr(0.11).range(0,1);
 var slope = LFTri.kr(0.11).range(0.5,0.8);
 var smooth = LFNoise1.kr(0.07).range(0.25,0.7);
 var chord = LFNoise1.kr(0.03).range(0.0,0.5);
 var oscs = MiTides.ar(pit.midicps, shape, slope, smooth, chord);
 var envs = MiTides.ar(speed, 0.35, 0, 0.46, 0.92, clock: clock, ratio: 9, rate: 0);
 var scaler = LFNoise1.kr( [0.1, 0.07, 0.11, 0.05] );
 var mix = oscs * envs * scaler;
 var out = Splay.ar(mix, center: LFTri.kr(0.1));
 var del = CombL.ar(out, 2, del_times, 6, mul: 0.5);
 out + del}

// PlayBuf
{arg buf = 0
;var scl = BufRateScale.kr(buf)
;PlayBuf.ar(2,bu,scl,1,0,1,0)}

// PlayBuf
{var b = MouseX.kr(32,64,0,0.2)
;var r = BufRateScale.kr(b)
;PlayBuf.ar(1,b,r,1,0,1,0)}

// SinOscFB
{SinOscFB.ar([400,301],MouseX.kr(0,4))*0.1}

// SinOscFB
{var y = MouseY.kr(10,1000,'exponential')
;var x = MouseX.kr(0.5pi,pi)
;SinOscFB.ar(y,x) * 0.1}

// SinOscFB
{var y = MouseY.kr(1,1000,'exponential')
;var x = MouseX.kr(0.5pi,pi)
;SinOscFB.ar(100 * SinOscFB.ar(y)+200,x) * 0.1}

// SineShaper
{SineShaper.ar(SinOsc.ar([400, 404], 0, 0.2), MouseX.kr(0, 1))}

// SineShaper
{SineShaper.ar(SoundIn.ar, MouseX.kr(0, 1))}

// Summer
{SinOsc.ar(Summer.kr(Impulse.kr(5), 1.5, 0, 0).poll * 100, 0, 0.1)}

// Summer
{var trig = Dust.kr(5)
;var reset = Impulse.kr(0.5)
;SinOsc.ar(Summer.kr(trig, [0.5, 0.25], reset, 1) * 100, 0, 0.1)}

// TGrains ; demand ugens as inputs ; (Warning: empty sequence in Dseq - Server 'localhost' exited with exit code 0)
{arg buf = 0
;var trate = MouseX.kr(1, 100, 1)
;var d = {Dwhite(0.1, 0.2, 1)}
;var z = {Drand([Dgeom(0.1, 1 + d.value, Diwhite(20, 40, 1))
                ,Dgeom(1, 1 - d.value, Diwhite(20, 40, 1))], 1)}
;TGrains.ar(2,
        Impulse.ar(trate),
        bufnum: buf,
        rate: Dseq([1, 1, z.value, 0.5, 0.5, 0.2, 0.1, 0.1, 0.1, 0.1], inf) * 2 + 1,
        centerPos: Dseq(z.dup(8), inf),
        dur: Dseq([1, d.value, 1, z.value, 0.5, 0.5, 0.1, z.value] * 2, inf) / trate,
        pan: Dseq([1, 1, 1, 0.5, 0.2, 0.1, 0, 0, 0], inf) * 2 - 1,
        amp: Dseq([1, 0, z.value, 0, 2, 1.0, 1, 0.1, 0.1], inf))}

// Vibrato
{SinOsc.ar(Vibrato.ar(DC.ar(400.0),1,0.02))*0.1}

// Vibrato
{SinOsc.ar(Vibrato.kr(400.0,1,0.02))}

// Vibrato
{x=MouseX.kr(2.0,100.0)
;y=MouseY.kr(0.0,1.0)
;v=Vibrato.ar(DC.ar(400.0),x,0.1,1.0,1.0,y,0.1)
;SinOsc.ar(v)}

// Vibrato
{n=LFNoise1.kr(1,3,7)
;x=MouseX.kr(0.0,1.0)
;y=MouseY.kr(0.0,1.0)
;v=Vibrato.ar(DC.ar(400.0),n,x,1.0,1.0,y,0.1)
;SinOsc.ar(v)}

// ---- ; drawings

// MiTides ; mode=FREQUENCIES
{MiTides.ar(10, 0.2, 0.7, output_mode: 3)}.plot(1)

// MiTides ; mode=PHASES
{MiTides.ar(3, 0.2, output_mode: 2)}.plot(1)
