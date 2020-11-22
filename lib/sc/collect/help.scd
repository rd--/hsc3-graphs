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
