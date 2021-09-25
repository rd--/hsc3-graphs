// https://fredrikolofsson.com/f0blog/more-sc-twitter/ f0
{var o = Pulse.ar(Pulse.ar(#[1, 2] / 3, 1 / 9) * 50 + #[50, 150], 0.5)
;var m = Pulse.ar(#[3, 4], 1 / 3) + Pulse.ar(#[2, 3], 1 / 4) / 10 + 0.005
;CombN.ar((Slope.ar(o) * m).cos / 5, 1, 1 / 6, 2)}

//---- https://fredrikolofsson.com/f0blog/more-sc-twitter/ f0
{a=Pulse;CombN.ar(Slope.ar(a.ar(a.ar([1,2]/3,1/9,50,[50,150])),a.ar([3,4],1/3)+a.ar([2,3],1/4)/10+0.005).cos/5,1,1/6,2)}
