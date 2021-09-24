// f0 ; subset (rd) ; https://twitter.com/redFrik/status/1395519538008141835
{var f = {arg x; SinOscFB.ar(freq: x, feedback: 0).max(0)}
;var p = [250, 200] * Duty.ar(dur: 4.096, reset: 0, level: Dseq.new(list: [4, 6, 5, 5, 5, 5, 3] / 4, repeats: inf)).lag(0.1)
;SinOscFB.ar(freq: p, feedback: f.value(0.08), mul: f.value(1 / [99, 60]) / 3) * 0.1}
