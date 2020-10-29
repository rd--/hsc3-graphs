// https://www.listarc.bham.ac.uk/lists/sc-users/msg14775.html
{var fn =
  {var lfo = Dstutter(2, Dxrand([0.1,0.2,0.3,0.4,0.5],inf))
  ;var dur = Duty.ar(lfo, 0, lfo)
  ;var trg = HPZ1.ar(dur).abs>0
  ;var pha = Sweep.ar(trg, 1/dur)
  ;pha.linexp(0, 1, rrand(50,100), rrand(500,2000))}
;var freqs = 8.collect(fn)
;var sig = Splay.ar(SinOsc.ar(freqs))
;Limiter.ar(Rotate2.ar(sig[0],sig[1],LFSaw.kr(0.1))) * 0.1}
