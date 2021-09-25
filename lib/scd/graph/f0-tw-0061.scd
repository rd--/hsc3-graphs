// https://fredrikolofsson.com/f0blog/more-sc-twitter/, f0
{var t = Saw.ar(#[9, 9.01])
;var f = Demand.ar(t, 0, Dseq.new(#[0, 0, 0, 0, 0, 0, 500], inf))
;var p = SinOsc.ar(Demand.ar(t, 0, Dshuf.new(8.iota * 99, inf)).lag(0.04), 0)
;SinOsc.ar(f, p) / 2}

//---- https://fredrikolofsson.com/f0blog/more-sc-twitter/
{var a=Demand;var b=SinOsc;b.ar(a.ar(t=Saw.ar([9,9.01]),0,Dseq(0!6++500,inf)),b.ar(a.ar(t,0,Dshuf((0..7)*99,inf)).lag(0.04)))/2}
