// http://article.gmane.org/gmane.comp.lang.haskell.art/993

SynthDef(\lp,{
	arg in_bus=0,out_bus=0,buf_num=0,lp_frames=48000,rec_level=1,mute=0,oct=1,dir=1,latency=256,t_reset=0;
	var lp_frames_chk = min(BufFrames.kr(buf_num),lp_frames);
	var rec_ph = Phasor.ar(t_reset,oct * dir,0,lp_frames_chk,0);
	var play_ph = Wrap.ar((rec_ph + latency),0,lp_frames_chk - 1);
	var play_rd = BufRd.ar(1,buf_num,play_ph,1,2);
	var rec_rd = BufRd.ar(1,buf_num,rec_ph,1,2);
	var in_sig = SoundIn.ar(in_bus) * rec_level;
	var env = EnvGen.kr(Env.adsr(0.05,1,1,0.1),1 - mute);
	BufWr.ar(in_sig + rec_rd, buf_num, rec_ph, 1);
	Out.ar(out_bus,play_rd.dup * env);
}).add;

SynthDescLib.at(\lp).def.draw
b = Buffer.alloc(s,2 * s.sampleRate);
l = Synth(\lp, [\buf_num, b, \lp_frames, b.numFrames]);
l.set(\lp_frames, b.numFrames);
l.set(\rec_level, 1.0);
l.set(\mute, 0.0);
l.set(\oct, 1.0);
l.set(\dir, 1.0);
l.set(\latency, 300);
l.set(\t_reset, 1);
b.zero

r = {{l.set(\oct, rrand(0.75,1.15)); l.set(\dir, [-1.0,1.0].choose); rrand(0.15,0.5).wait}.loop}.fork;
r.stop;
