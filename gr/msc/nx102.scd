// <http://sccode.org/1-4QO> (cmn)

b = Buffer.read(s,Platform.resourceDir +/+ "sounds/a11wlk01.wav",bufnum:1);

{var r = Rand(50,100)
;var b = PlayBuf.kr(1,1,r,1,0,1)
;var f = (b * Rand(100,1000)).clip(Rand(5,12),Rand(12,20))
;var o = Pulse.ar(f)
;var lrf = Rand(100,5000)
;var lrq = Rand(0.005,0.1)
;var hrf = Rand(5000,20000)
;var hrq = Rand(0.005,0.1)
;var s = RHPF.ar(RLPF.ar(o,lrf,lrq),hrf,hrq)
;var v = FreeVerb.ar(s,0,0,0)
;var pk = {|i,n,k| BPeakEQ.ar(i,n,6.0,k)}
;var q = pk.(pk.(pk.(pk.(v,100,6),1000,0),5000,0),10000,6)
;Pan2.ar(LeakDC.ar(Normalizer.ar(q,1.25,0.1)),0)}.play
