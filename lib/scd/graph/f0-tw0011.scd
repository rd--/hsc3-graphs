// tw 0011 (f0)
{var s = {|o,i| SinOsc.ar([i,i + 0.0001] ** 2 * f.value(o,i-1),f.value(o,i - 1) * 0.0001) * f.value(o,i - 1)}
;var f = {|o,i| if(i > 0,{s.value(o,i)},o)}
;f.value(60,6) / 60}
