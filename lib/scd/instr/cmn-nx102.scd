// http://sccode.org/1-4QO (cmn)

Buffer.read(s,Platform.resourceDir +/+ "sounds/a11wlk01.wav",bufnum:10);

{arg buf = 10
;var r = Rand.ir(50,100)
;var pb = PlayBuf.kr(1,buf,r,1,0,1)
;var f = (pb * Rand.ir(100,1000)).clip(Rand.ir(5,12),Rand.ir(12,20))
;var o = Pulse.ar(f)
;var lrf = Rand.ir(100,5000)
;var lrq = Rand.ir(0.005,0.1)
;var hrf = Rand.ir(5000,20000)
;var hrq = Rand.ir(0.005,0.1)
;var s = RHPF.ar(RLPF.ar(o,lrf,lrq),hrf,hrq)
;var v = FreeVerb.ar(s,0,0,0)
;var pk = {|i,n,k| BPeakEQ.ar(i,n,6.0,k)}
;var q = pk.value(pk.value(pk.value(pk.value(v,100,6),1000,0),5000,0),10000,6)
;Pan2.ar(LeakDC.ar(Normalizer.ar(q,1.25,0.1)),0)}.play
