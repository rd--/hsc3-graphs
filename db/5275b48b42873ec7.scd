// tw 0011 (f0)
{var s = {|o,i| SinOsc.ar([i,i + 0.0001] ** 2 * f.(o,i-1),f.(o,i - 1) * 0.0001) * f.(o,i - 1)}
;var f = {|o,i| if(i > 0,{s.(o,i)},o)}
;f.(60,6) / 60}
